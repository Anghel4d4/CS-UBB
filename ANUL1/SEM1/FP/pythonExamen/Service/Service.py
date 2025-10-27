from Domain.Entitati import Jucator
from Domain.Validatori import VALIDATOR
from Repository.Repository import REPOSITORY


class SERVICE:
    def __init__(self, repo, validator):
        """
        Initializeaza o clasa pentru gestiunea comenzilor primite de la utilizator.
        :param repo: parametru de tip repo_jucator, pentru a face legatura intre cele doua clase.
        :param and type validator: are scopul de a valida jucatorii ce doresc a fi introdusi de la utilizator, type validator
        """
        self.__repo = repo
        self.__validator = validator

    def add(self, nume, prenume, inaltime, post):
        """
        Adauga un obiect de tip jucator la lista, daca acesta are campuri valide.
        """
        jucator = Jucator(nume, prenume, inaltime, post)

        self.__validator.validate(jucator)
        self.__repo.add(jucator)

    def modificare(self, nume, prenume, inaltime):
        self.__validator.validate(Jucator(nume, prenume, inaltime, 'fundas'))
        self.__repo.modificare(nume, prenume, inaltime)

    def generare(self):
        """
        Genereaza jucatori cu nume si prenume dintr-un fisier existent.
        """
        return self.__repo.generare()

    @staticmethod
    def filtrare_dupa_post(lista, post):
        """
        Filtreaza jucatorii dupa pozitie.
        """
        return [jucator for jucator in lista if jucator.get_post() == post]

    @staticmethod
    def selecteaza_cel_mai_inalt(lista):
        """
        Selecteaza cel mai inalt jucator dintr-o lista.
        """
        return max(lista, key=lambda x: int(x.get_inaltime())) if lista else None

    def echipa(self):
        """
        Genereaza o echipa cu cea mai mare medie de inaltime (2 extreme, 2 fundasi, un pivot).
        """
        # Incarcam lista de jucatori
        lista_jucatori = self.__repo.load_from_file()

        # Filtram jucatorii dupa pozitii
        extreme = self.filtrare_dupa_post(lista_jucatori, 'extrema')
        fundasi = self.filtrare_dupa_post(lista_jucatori, 'fundas')
        pivoti = self.filtrare_dupa_post(lista_jucatori, 'pivot')

        # Verificam daca exista destui jucatori pentru a forma o echipa
        if len(extreme) < 2 or len(fundasi) < 2 or len(pivoti) < 1:
            print("Nu exista suficienti jucatori pentru a forma o echipa completa.")
            return None

        # Alegem jucatorii pentru echipa
        prima_extrema = self.selecteaza_cel_mai_inalt(extreme)
        extreme.remove(prima_extrema)
        a_doua_extrema = self.selecteaza_cel_mai_inalt(extreme)

        primul_fundas = self.selecteaza_cel_mai_inalt(fundasi)
        fundasi.remove(primul_fundas)
        al_doilea_fundas = self.selecteaza_cel_mai_inalt(fundasi)

        pivot = self.selecteaza_cel_mai_inalt(pivoti)

        # Verificam daca am reusit sa selectam jucatorii necesari
        if None in [prima_extrema, a_doua_extrema, primul_fundas, al_doilea_fundas, pivot]:
            print("Nu s-au putut selecta jucatori potriviti pentru toate pozitiile.")
            return None

        # Returnam echipa
        return [prima_extrema, a_doua_extrema, pivot, primul_fundas, al_doilea_fundas]


def test_echipa():
    repo_test = REPOSITORY('./data/players_test.txt')
    validator_test = VALIDATOR()
    srv_test = SERVICE(repo_test, validator_test)
    lista_save = repo_test.load_from_file()

    assert srv_test.echipa()[0].get_nume() == 'nume7'
    assert srv_test.echipa()[1].get_nume() == 'nume6'
    assert srv_test.echipa()[2].get_nume() == 'nume5'
    assert srv_test.echipa()[3].get_nume() == 'nume4'
    assert srv_test.echipa()[4].get_nume() == 'nume1'
    repo_test.save_to_file(lista_save)


test_echipa()


def test_add():
    repo_test = REPOSITORY('./data/players_test.txt')
    validator_test = VALIDATOR()
    srv_test = SERVICE(repo_test, validator_test)
    lista_save = repo_test.load_from_file()
    lungime = len(lista_save)

    try:
        srv_test.add('', '', 190, 'nu fundas')
        assert False
    except ValueError:
        assert True

    srv_test.add('nume', 'prenume', 190, 'pivot')
    lista = repo_test.load_from_file()
    assert lista[-1].get_nume() == 'nume'
    assert len(lista) == lungime + 1

    repo_test.save_to_file(lista_save)


test_add()


def test_modificare():
    repo_test = REPOSITORY('./data/players_test.txt')
    validator_test = VALIDATOR()
    srv_test = SERVICE(repo_test, validator_test)
    lista_save = repo_test.load_from_file()

    try:
        srv_test.modificare('nume10', 'prenume9', 170)
        assert False
    except ValueError:
        assert True
    srv_test.modificare('nume9', 'prenume9', 170)
    lista = repo_test.load_from_file()

    assert lista[-1].get_inaltime() == '170'

    repo_test.save_to_file(lista_save)


test_modificare()


def test_generare():
    repo_test = REPOSITORY('./data/players_test.txt')
    validator_test = VALIDATOR()
    srv_test = SERVICE(repo_test, validator_test)
    lista_save = repo_test.load_from_file()
    lungime = len(lista_save)

    assert srv_test.generare() == 8
    lista = repo_test.load_from_file()
    assert len(lista) == lungime + 8

    repo_test.save_to_file(lista_save)


test_generare()
