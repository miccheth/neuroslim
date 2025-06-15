#import "@preview/charged-ieee:0.1.2": ieee

#let summary_model_img = read("./img/summary.drawio.svg")
#let dijistra = read("./img/dijistra.svg")

#let input_agent = read("./img/input-agent.drawio.svg")
#let input_agent_handler = read("./img/input-agent-handler.drawio.svg")

#let neuron = read("./img/neuron.drawio.svg")

#show: ieee.with(
  title: [Un possibile modello di 'mente' artificiale],
  abstract: [
    Il seguente modello vuole imitare il funzionamento neuronale del cervello che ne scaturisce i fenomi cognitivi e conscienziali che avvengono, per lo meno, nell'essere umano.
  ],
)

#figure(
  image.decode(summary_model_img, width: 120%),
  caption: [
    Riepilogo del modello (non ancora definitivo)
  ],
)

= Premessa: ciò che ancora è nel dubbio

+ La coscienza deve avere a forza sede nel cervello, sennò come si spiega quando la nostra ragione viene manipolata/alterata a seguito di utilizzo sostanze stupefacenti/bevande alcoliche?
   + Probabile risposta: sì, la coscienza ha sede nel cervello, si sviluppa a seguito un agglomerazione molto elevato di input con una correlazione/senso. Se guardiamo un animale o un neonato umano vediamo come se non avessero una coscienza, hanno un comportamento simile. Molto semplicmente è dovuto che nel loro cervello la coscienza non è ancora sviluppata, perchè non hanno ancora i miliardi di collegamenti sinaptici per far scaturire "l'esistenza"
     + Contro risposta: visto che il fenomeno dei sogni si sviluppa a seguito che vengono 'spenti' o alzato il grado di sensibilità minimo dei biorecettori, che avviene mentre dormiamo. Infatti succede che sogniamo ciò che accaduta nella giornata, e anche ciò che non la riguarda, dovuta al motivo che vengono eccitate tutte le aree che hanno un avuto un collegamento vicino. Però come si spiegano i sogni lucidi che noi diventiamo coscienti, o abbiamo atto quando ci svegliamo di aver sognato?

+ Un collegamento sinpatico che non si presenta mai, come vengono gestite? Magari rimane, ma diminuisce l'importanza mediamente la diminuizione delle sinapsi?
   + Probabile risposta: diminuiscono le sinapsi che riguarda il ricordo, dopo un tot x tempo. Nel caso del nostro modello andremo a diminiuire il 'peso'.

+ La ragione per cui nel nostro cervello vengono scartate gli input comuni e sempre presenti, come per esempio se indossiamo un vestito, la respirazione, è che magari sono dati di bassa intensità (peso = zero), oppure le informazioni che coinvolgono il nostro quotidiano, una volta saldata diventono di norma di bassa intensità perchè il nostro cervello le ha 'saldate'?

+ Cosa avviene nel cervello quando riceve un input che ha già creato un collegamento sinaptico, vengono eccitate le sinapsi più vicini/forti?

+ Quando pensiamo ad un qualcosa/problema, e facciamo fatica a risolvere e ricordare, il delay che si genera è dovuto che vengono eccitate tutti collegamenti sinaptici per arrivare alla soluzione?

+ Esiste un fine all'elaborazione cerebrale di un problema?

+ Come facciamo a pensare, ed attivare i motoneuroni quando vogliamo muovere un braccio? Cosa avviene nel cervello?

+ Il cervello prende in considerazione soltanto gli input più intensi (quindi con un peso maggiorato)?

+ Il cervello ignora le informazioni non leggibili, o non vengono prese in considerazione?
   + Probabile risposta: sì, ciò che non è campionabile non può essere matematicante analizzato, siccome non vediamo gli atomi, senza usare strumenti particolari non sapremmo nemmeno che esistano.

+ Il cervello quando riceve un input che ha già 'sentito', ma cambia il tipo di informazione, cosa fa?
   + Probabile risposta, molto sicura: va a ricreare soltanto il nuovo collegamento, semplice.

+ Cosa succede quando il cervello raggiungere il massimo numero di informazioni che può immagazzinare?

+ L'intelligenza e la coscienza sono proporzionali alla informazioni?
   + Probabile risposta: sì, per quanto riguarda l'intelligenza possiamo esserne sicuri perchè se facciamo fare un test QI a due persone, e uno sa già come risolverlo, risulterà matematicamente più intelligente dell'altro. Semplicemente dal fatto di avere più informazioni.

+ Il cervello funziona in modo asincrono o sincrono?
  + Probabile risposta: funziona in modo sincrono, però gli organi di sensi sono asincroni.

+ Nel cervello ci sono problematiche di collissioni, potrebbero esserci?

+ I collegamenti/neuroni già presenti non vengono salvati, ma 'eccitati' direttamente?
  
+ *Avrebbe senso come test del modello capire se esempio riesce a fare i calcoli in matematica, senza usare la calcolatrice?*


= I Componenti

== *Lo pseudo algoritmo di Dijistra*

#figure(
  image.decode(dijistra, width: 120%),
  caption: [
    L'algoritmo di Dijistra
  ],
  placement: none
)

Sicuramente il modello dovrà possedere un implementazione imita il funzionamento dell'algoritmo di Dijistra. *Si occuperà:*
  + assegnare i pesi iniziali, e di cambiarli man mano, in base all loro importanza.
  + trovare sempre il percorso migliore coerente associativamente e più vicino, anche in caso venga persa una piccola parte del collegamento.
  + partire da una pos A ed arrivare una Z, cioè alla sua fine, deve capire quando smettere di sollecitare la memoria del modello.
  + creare l'associazione sia spaziale che temporale (*cioè che avvenuta nello stesso colpo di clock, si può implementare mettendo una sorta di Array su ogni neurone?*)
  + collegare un nuova informazione che però ha un legame con un altra già campionata e definire il relativo peso.

#v(1cm)
== *Input Agent*

#figure(
  image.decode(input_agent, width: 75%),
  caption: [
    Un esempio di input agent testuale, notiamo che segmenta il minimo dei dati che può leggere.
  ],
  placement: none
)

Questi trasduttori si occuperanno di captare i segnali provenienti dall'ambiente esterno, campionarlo per trovare i vari minimi leggibili, e a seguito inviarli all'Input Agent Handler.

Ogni input agent può averne una sotto categoria, esempio: Input Agent Pixels --> Input Agent Pixels (Riconoscimento Colori), Input Agent Pixels (Riconoscimento Forme) (Ha senso?)

#v(1cm)
== *Il gestore degli input: Input Agent Handler*

#figure(
  image.decode(input_agent_handler, width: 100%),
  caption: [
    Esempio di vari input agent che portano le informazioni all'Handler. Rimane ancora nel limbo come codificare in modo univoco ed associare le varie informazioni ricevute in un dato clock.
  ],
  placement: none
)

Una delle parti centrali del modello, dovrà gestire le informazioni che gli arriveranno, trasdotte, dai vari input agent. *Si occuperà:*
  + tenere sincronizzato il suo clock interno.
  + codificare le informazioni provenienti dall'esterno alla The Memory
  + creare il collegamento sensato tra i vari input trasdotti sfruttando il Synaptic Algorithm.
  + tenere una coda con tutte le informazioni da codificare/unire in una coda.
  + gestire la vicinanza di associazione tra vari input agent diversi, mettendo magari un Array o un flag che fa capire che c'è stato lo stesso input nello stesso colpo di clock
  + scartare le informazioni già associate temporalmente e spazialmente, ma soltanto eccitarle

== *Il neurone*

#figure(
  image.decode(neuron, width: 80%),
  caption: [
    Esempio di un nuovo neurone generato, con il suo input agent di creazione. con un collegamento 'sinaptico'
  ],
  placement: none
)

I singoli neuroni sono le singole minime informazione archiviate, una delle parti centrali del modello. *E' formato da:*
  + l'informazione minima che contiene, ovviamente non potrà essere duplicata.
  + ogni singolo neurone fa parte di uno specifico gruppo, che dipenderà dall'input agent da dove è stato generato.
  + può contenere un numero infinito (con il limite della memoria digitale) di collegamento sinaptici.
  + può contenere un numero infinito di *'vicinanza' di associazione*

#v(1cm)
== *The Memory*

E' la parte di archiviazione del modello, contiene tutto ciò che ha campionato dall'esterno, e tiene le informazioni collegate, come esplicitato dal modello.
*Ha le seguenti funzionalità:*
     + pulire la memoria, togliendo le informazioni 'spazzatura'



