from collections import defaultdict, deque
import random

class Neurone:
    def __init__(self, simbolo):
        self.simbolo = simbolo
        self.energia = 0
        self.collegamenti_out = set()
        self.collegamenti_in = set()

class CategoriaComplessa:
    def __init__(self, pattern):
        self.pattern = tuple(pattern)  # es: ('c', 'i', 'a', 'o')
        self.frequenza = 1
        self.attivazione = 0
        self.risposte_associate = defaultdict(int)  # risposta -> punteggio

    def rinforza(self):
        self.frequenza += 1

    def associa_risposta(self, risposta):
        self.risposte_associate[risposta] += 1

    def risposta_dominante(self):
        if not self.risposte_associate:
            return None
        return max(self.risposte_associate.items(), key=lambda x: x[1])[0]

class ReteCognitiva:
    def __init__(self):
        self.neuroni = {}  # simbolo -> Neurone
        self.categorie_complesse = {}  # pattern -> CategoriaComplessa
        self.workspace = GlobalWorkspace()
        self.energia_massima = 100

    def ricevi_input(self, stringa):
        caratteri = list(stringa)
        attivi = []

        for c in caratteri:
            if c not in self.neuroni:
                self.neuroni[c] = Neurone(c)
            neurone = self.neuroni[c]
            neurone.energia = 1  # attivazione istantanea
            attivi.append(neurone)

        # tentativo di attivazione di categorie complesse
        attivati = []
        for cat in self.categorie_complesse.values():
            if list(cat.pattern) == caratteri:
                cat.attivazione += 1
                cat.rinforza()
                self.workspace.inserisci(cat)
                attivati.append(cat)

        if not attivati:
            # nuova categoria temporanea
            nuova = CategoriaComplessa(caratteri)
            self.categorie_complesse[nuova.pattern] = nuova
            self.workspace.inserisci(nuova)

    def apprendi_risposta(self, input_str, risposta):
        chiave = tuple(list(input_str))
        if chiave in self.categorie_complesse:
            self.categorie_complesse[chiave].associa_risposta(risposta)

    def genera_risposta(self):
        dominante = self.workspace.seleziona()
        if dominante:
            return dominante.risposta_dominante()
        return None

    def decadimento(self):
        for cat in self.categorie_complesse.values():
            cat.attivazione *= 0.9  # decadimento lento

class GlobalWorkspace:
    def __init__(self):
        self.buffer = deque(maxlen=5)  # memoria di lavoro

    def inserisci(self, categoria):
        self.buffer.append(categoria)

    def seleziona(self):
        if not self.buffer:
            return None
        # seleziona la categoria con attivazione + frequenza maggiori
        return max(self.buffer, key=lambda c: (c.attivazione + c.frequenza))

# -----------------------------
# ESEMPIO D'USO
# -----------------------------

rete = ReteCognitiva()

# Addestramento
rete.ricevi_input("ciao")
rete.apprendi_risposta("ciao", "ciao")

print("Risposta finale della rete:", rete.genera_risposta())
