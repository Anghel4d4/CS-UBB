def f(l):
    """
    Funcția returnează numărul de elemente pare dintr-o listă de numere.

    Parametrii:
    l (list): O listă de numere întregi.

    Returnează:
    int: Numărul de elemente pare din listă.

    Erori:
    ValueError: Dacă l este None sau lista este goală.
    """
    if l is None or l == []:
        raise ValueError("Lista nu trebuie să fie None sau goală.")

    aux = {0: 0, 1: 0}
    for e in l:
        aux[e % 2] += 1

    return aux[0]


# Teste pentru funcția f
def test_f():
    try:
        # Teste de funcționare corectă
        assert f([1, 2, 3, 4, 5, 6]) == 3, "Test 1 Eșuat: Așteptat 3"
        assert f([2, 4, 6, 8]) == 4, "Test 2 Eșuat: Așteptat 4"
        assert f([1, 3, 5, 7]) == 0, "Test 3 Eșuat: Așteptat 0"
        assert f([10, 20, 30, 40]) == 4, "Test 4 Eșuat: Așteptat 4"

        # Teste de validare a erorilor
        try:
            f(None)
        except ValueError as e:
            assert str(
                e) == "Lista nu trebuie să fie None sau goală.", "Test 5 Eșuat: Așteptat ValueError cu mesajul 'Lista nu trebuie să fie None sau goală.'"

        try:
            f([])
        except ValueError as e:
            assert str(
                e) == "Lista nu trebuie să fie None sau goală.", "Test 6 Eșuat: Așteptat ValueError cu mesajul 'Lista nu trebuie să fie None sau goală.'"

        print("Toate testele au fost trecute cu succes!")
    except AssertionError as e:
        print(e)


# Apelarea funcției de testare
test_f()
