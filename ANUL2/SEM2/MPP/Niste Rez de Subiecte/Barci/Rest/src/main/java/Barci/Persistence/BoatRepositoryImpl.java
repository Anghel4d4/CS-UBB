package Barci.Persistence;

import Barci.Domain.Boat;
import Barci.Persistence.Utils.HibernateUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

@Repository
public class BoatRepositoryImpl implements BoatRepository {
    private static final Logger logger = LogManager.getLogger(BoatRepositoryImpl.class);

    @Override
    public void saveBoat(Boat boat) {
        logger.info("Saving boat with positions: {}, {}, {}", boat.getPosition1(), boat.getPosition2(), boat.getPosition3());
        try (Session session = HibernateUtils.getSessionFactory().openSession()) {
            session.beginTransaction();
            session.persist(boat);
            session.getTransaction().commit();
            logger.info("Boat saved successfully with id: {}", boat.getId());
        } catch (Exception e) {
            logger.error("Error saving boat: {}", e.getMessage());
            throw e;
        }
    }

    @Override
    public boolean arePositionsValid(String pos1, String pos2, String pos3) {
        logger.info("Validating positions: {}, {}, {}", pos1, pos2, pos3);
        int[] coords1 = parsePosition(pos1);
        int[] coords2 = parsePosition(pos2);
        int[] coords3 = parsePosition(pos3);

        if (coords1 == null || coords2 == null || coords3 == null) return false;

        boolean sameRow = coords1[0] == coords2[0] && coords2[0] == coords3[0];
        boolean sameCol = coords1[1] == coords2[1] && coords2[1] == coords3[1];

        if (!sameRow && !sameCol) return false;

        boolean adjacent;
        if (sameRow) {
            int[] allCoords = {coords1[1], coords2[1], coords3[1]};
            java.util.Arrays.sort(allCoords);
            adjacent = (allCoords[1] - allCoords[0] == 1) && (allCoords[2] - allCoords[1] == 1);
        } else {
            int[] allCoords = {coords1[0], coords2[0], coords3[0]};
            java.util.Arrays.sort(allCoords);
            adjacent = (allCoords[1] - allCoords[0] == 1) && (allCoords[2] - allCoords[1] == 1);
        }

        logger.info("Positions validation result: {}", adjacent);
        return adjacent;
    }

    private int[] parsePosition(String pos) {
        if (pos == null || !pos.matches("\\(\\d+,\\d+\\)")) return null;
        String[] parts = pos.replace("(", "").replace(")", "").split(",");
        return new int[]{Integer.parseInt(parts[0]), Integer.parseInt(parts[1])};
    }
}