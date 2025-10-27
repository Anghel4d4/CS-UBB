from Service.Service import SERVICE
class Console:
    def __init__(self, srv):
        """
        Initializeaza o clasa pentru a gestiona datele introduse de utilizator, pentru a putea fi trimise spre prelucrare.
        :param and type srv: parametru de tip service, care face legatura dintre cele doua clase
        """
        self.__srv = srv

    def add(self):
        """
        Adauga un jucator la lista de jucatori, numele si prenumele nu poate fi vid.
        """
        nume = input('Introduceti numele: ')
        prenume = input('Introduceti prenumele: ')
        inaltime = input('Introduceti inaltimea: ')
        post = input('Introduceti postul: ')

        try:
            self.__srv.add(nume, prenume, inaltime, post)
        except ValueError as ve:
            print((str(ve)))

    def modificare(self):
        """
        Modifica inaltimea unui jucator.
        """
        nume = input('Introduceti numele: ')
        prenume = input('Introduceti prenumele: ')
        inaltime = input('Introduceti NOUA inaltimea: ')

        try:
            self.__srv.modificare(nume, prenume, inaltime)
        except ValueError as ve:
            print(str(ve))

    def generare(self):
        """
        Genereaza jucatori cu nume si prenume dintr-un fisier existent.
        """
        cnt = self.__srv.generare()
        print('Au fost importati ' + str(cnt) + ' jucatori')

    def echipa(self):
        """
        Genereaza o echipa cu cea mai mare medie de inaltime (2 extreme, 2 fundasi, un pivot).
        """
        for el in self.__srv.echipa():
            print(el)
    def start(self):
        """
        Porneste interfata de consola pentru utilizator.
        """
        while True:
            print('---------------------------')
            print('      MENIU PRINCIPAL      ')
            print('---------------------------')
            print('Optiunile disponibile sunt:')
            print('1. Adauga')
            print('2. Modificare')
            print('3. Generare')
            print('4. Echipa')
            print('5. Stop')
            print('---------------------------')

            cmd = input('Optiunea dvs este: ')

            if cmd == '1':
                self.add()
            elif cmd == '2':
                self.modificare()
            elif cmd == '3':
                self.generare()
            elif cmd == '4':
                self.echipa()
            elif cmd == '5':
                return
            else:
                print('Comanda invalida! Va rugam selectati o optiune valida.')