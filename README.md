# Numerical-Music-and-Rec
TASK 1

SPECTOGRAMA
Calculul Dimensiunii Spectrogramei: Funcția calculează dimensiunea spectrogramei în funcție de dimensiunea semnalului de intrare și dimensiunea ferestrei. Aceasta asigură că spectrograma va avea o dimensiune corespunzătoare pentru a reflecta spectrul semnalului în timp.

Generarea Vectorului de Frecvențe: Un vector de frecvențe este generat folosind funcția linspace pentru a acoperi intervalul de la 0 la jumătate din frecvența de eșantionare. Numărul de puncte din vector este egal cu dimensiunea ferestrei plus unul, pentru a obține o frecvență corespunzătoare fiecărui bin spectral.

Calculul Vectorului de Timp: Vectorul de timp este generat folosind funcția linspace pentru a acoperi intervalul de timp corespunzător spectrogramei. Numărul de elemente din acest vector este egal cu numărul de ferestre spectrografice calculate.

Aplicarea Ferestrei Hanning: Se utilizează fereastra Hanning pentru a minimiza pierderile la marginile ferestrei. Aceasta se aplică la fiecare fereastră a semnalului de intrare.

Calculul Transformatei Fourier Rapide (FFT): Pentru fiecare fereastră a semnalului de intrare, se calculează transformata Fourier rapidă (FFT) pentru a obține spectrul semnalului în domeniul frecvenței.

Extragerea Amplitudinilor: Se extrag amplitudinile spectrale din spectrul obținut prin FFT.

Reprezentarea Spectrogramei: Amplitudinile spectrale sunt stocate în matricea spectrogramă, unde fiecare coloană reprezintă spectrul semnalului într-un anumit interval de timp.

OSCILATOR

Generarea Vectorului de Timp: Un vector de timp este generat cu ajutorul funcției linspace, asigurându-se că acoperă intervalul de la 0 la durata specificată.
Generarea Undei Sinusoidale: Se generează o undă sinusoidală cu frecvența specificată.
Calculul Parametrilor Envelopei: Se calculează numărul de eșantioane pentru fiecare parte a envelopei, luând în considerare frecvența de eșantionare și durata semnalului.
Crearea Envelopei: Se creează envelopele pentru atac, decay, sustain și release, folosind funcții liniare de rampă. Acestea sunt concatenate pentru a forma un singur vector de envelope.
Ajustarea Dimensiunii Envelopei: Dacă lungimea envelopei nu este egală cu numărul total de eșantioane, se completează cu zero-uri.
Modularea Amplitudinii: Unda sinusoidală este modulată în amplitudine cu ajutorul envelopei.

LOW_PASS

Transformarea Fourier a Semnalului: Se aplică transformata Fourier asupra semnalului de intrare pentru a obține reprezentarea sa în domeniul frecvenței.
Generarea Vectorului de Frecvențe: Se creează un vector de frecvențe folosind funcția linspace, similar cu implementarea din funcția spectrogram.
Crearea Vectorului de Masca: Se generează un vector masca care are valori de 1 pentru frecvențele mai mici decât frecvența de tăiere și 0 pentru frecvențele mai mari.
Aplicarea Produsului Hadamard: Se aplică produsul Hadamard între transformata Fourier a semnalului și vectorul mască pentru a filtra frecvențele dorite.
Transformarea Inversă Fourier: Se aplică transformata inversă Fourier pentru a obține semnalul filtrat în domeniul timpului.
Normalizare: Semnalul filtrat este normalizat prin împărțirea la valoarea maximă a absolutului semnalului filtrat, pentru a asigura amplitudinea maximă de 1.

APPLY_REVERB

Ma asigur ca se indeplinesc conditiile necesare pentru aplicarea produslui
de convolutie si il aplic

REZULATATE SPECTOGRAMA IN STUDIO.M:
Diferenta "Plain Loop", "Plain Sound":
Diferența între cele două spectrograme este în principal legată de sursa de sunet utilizată. În timp ce Plain Loop poate fi un buclat sau repetat și poate avea anumite modele sau caracteristici spectrale distinctive, Plain Sound reprezintă semnalul original, fără nicio modificare sau procesare ulterioară.

Diferenta "Low Pass Sound", "Plain Sound":
În spectrograma "Plain Sound", observăm o gamă largă de frecvențe, incluzând atât frecvențe joase, cât și înalte.
În spectrograma "Low Pass Sound", după aplicarea filtrului de tăiere a frecvențelor, remarcăm că componentele de frecvență înalte, mai mari de 1000 Hz, au fost atenuate sau eliminate. Spectrograma apare mai netedă, cu mai puține detalii de frecvențe înalte comparativ cu spectrograma "Plain Sound".

Diferenta "Reverb Sound", "Plain Sound":
În spectrograma "Reverb Sound", observăm componente de frecvență suplimentare datorate efectului de reverberație. Reverberația introduce multiple reflexii și întârzieri, rezultând o spectrogramă mai densă, cu mai mult conținut de frecvență distribuit în timp comparativ cu spectrograma "Plain Sound".

Primele 500k samples, aprox 10 sec.:
-plot_spectrogram(S, f, t, "Reverb Tech"):
În spectrograma "Reverb Tech", observăm componente de frecvență suplimentare și o distribuție mai densă a energiei în timp comparativ cu spectrograma "Tech". Acest lucru se datorează efectului de reverberație, care introduce multiple reflexii și întârzieri în semnal.
-plot_spectrogram(S, f, t, "Low Pass + Reverb Tech"):
Comparând spectrogramele "Low Pass Tech" și "Low Pass + Reverb Tech", observăm că combinarea filtrului de tăiere a frecvențelor înalte cu efectul de reverberație introduce componente suplimentare de frecvență și o distribuție mai densă a energiei în timp comparativ cu filtrarea doar a frecvențelor înalte.
-plot_spectrogram(S, f, t, "Reverb + Low Pass Tech"):
"Reverb + Low Pass Tech":
În această variantă, putem observa inițial prezența unui spectru de frecvență extins, cu energie distribuită pe o gamă largă de frecvențe.
După aplicarea efectului de reverb, putem vedea adăugarea de energie la frecvențe mai joase, dar și o creștere generală a energiei în toată banda de frecvențe.
Ulterior, după aplicarea filtrului low-pass, vom observa o scădere a energiei la frecvențele mai ridicate, ceea ce poate duce la o imagine mai îngustă a spectrului de frecvență și la o accentuare a componentelor de frecvență mai joasă.
"Low Pass + Reverb Tech":
În această versiune, aplicarea filtrului low-pass înaintea efectului de reverb va duce inițial la o reducere a energiei la frecvențe mai ridicate, ceea ce poate conduce la o imagine mai îngustă a spectrului de frecvență.
Apoi, aplicarea efectului de reverb va adăuga reverberație și energie suplimentară în întreaga gamă de frecvențe, inclusiv în cele mai joase.

TASK 2

Cubic Spline Interpolation

spline_c2:
Inițializarea matricei și vectorului: Se creează matricea A și vectorul b pentru a rezolva sistemul de ecuații liniare.
Calculul coeficienților ai: Se completează primele n rânduri ale matricei 
A și primele n elemente ale vectorului b pentru a asigura ca spline-ul să treacă prin toate punctele.
Determinarea coeficienților pentru ultimul interval: Coeficienții pentru ultimul interval sunt determinați și adăugați la matricea 
A și vectorul b.
Asigurarea continuității între intervale: Se adaugă ecuațiile care asigură continuitatea între intervale pentru spline-ul 
si și si+1, atât pentru valori, cât și pentru derivatele de ordinul întâi și al doilea.
Asigurarea continuității derivatelor de ordinul întâi și al doilea: Se adaugă ecuațiile care asigură continuitatea derivatelor de ordinul întâi și al doilea între intervale.
Soluționarea sistemului de ecuații: Se calculează matricea inversă a 
A și se înmulțește cu vectorul b pentru a obține coeficienții spline-ului.

P_spline:
Calculul interpolării: Se parcurge fiecare punct xinterp(i) pentru a determina valoarea corespunzătoare yinterp(i).
Determinarea intervalului: Se determină intervalul în care se află 
xinterp(i) prin parcurgerea vectorului x.
Calculul valorii interpolată: După determinarea intervalului, se calculează valorile a , b, c, d corespunzătoare spline-ului din intervalul respectiv.
Interpolarea: Se calculează valoarea interpolată yinterp(i) folosind formula spline-ului.

vandermonde:
Crearea matricei Vandermonde: Se construiește matricea A cu puterile progresive ale fiecărui element din vectorul x.
Rezolvarea sistemului: Se calculează inversa matricei A și se înmulțește cu vectorul y pentru a obține coeficienții polinomului.

P_vandermonde:
Calculul valorilor interpolarării: Se parcurg fiecare punct x din vectorul de interpolare x_interp.
Pentru fiecare punct x, se calculează valoarea interpolată y folosind formula polinomului, unde a1...n sunt coeficienții din vectorul coef.

TASK 3

preprocess:
Parcurgerea matricei: Se parcurg toate rândurile matricei mat folosind un indice i.
Calculul numărului de recenzii: Se numără elementele diferite de zero din rândul curent folosind funcția nnz.
Eliminarea rândului: Dacă numărul de recenzii este strict mai mic decât min_reviews, atunci rândul respectiv este eliminat folosind operația de indexare mat(i, :) = []. Dimensiunea matricei este actualizată în consecință.
Trecerea la următorul rând: Dacă rândul nu este eliminat, se trece la următorul rând prin incrementarea lui i.
Returnarea matricei reduse: Matricea rezultată, fără rândurile eliminate, este returnată ca rezultat al funcției.

cosine_similarity: Se implementeaza formulele date

recommendations:
Citirea datelor: Se citesc datele din fișierul specificat de către calea path folosind funcția read_mat.
Preprocesarea datelor: Se aplică funcția preprocess pentru a elimina utilizatorii cu un număr mic de recenzii.
Factorizarea SVD: Se aplică descompunerea SVD asupra matricei preprocesate reduced_mat pentru a obține matricea V de dimensiuni corespunzătoare.
Calculul similitudinii: Se calculează similaritatea între tema apreciată și toate celelalte teme folosind măsura de similaritate cosine. Aceasta se realizează prin parcurgerea fiecărei teme din matricea V și calculând similaritatea cosine între tema apreciată și fiecare temă.
Sortarea și selectarea recomandărilor: Se sortează temele în funcție de similaritatea lor și se elimină tema apreciată din lista sortată. Se selectează primele num_recoms teme rămase în ordinea sortată, acestea reprezentând recomandările finale.
