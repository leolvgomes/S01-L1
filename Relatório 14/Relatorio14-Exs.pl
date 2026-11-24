% ==========================================
% RELATÓRIO 14 - BANCO DE DADOS: O MUNDO NINJA
% ==========================================

% Fatos: Linhagem de treinamento (mestre, discipulo) - HIERARQUIA DE MESTRES
mestre(hashirama, hiruzen).
mestre(tobirama, hiruzen).
mestre(hiruzen, jiraiya).
mestre(hiruzen, tsunade).
mestre(hiruzen, orochimaru).
mestre(jiraiya, minato).
mestre(jiraiya, nagato).
mestre(jiraiya, naruto).
mestre(minato, kakashi).
mestre(minato, obito).
mestre(minato, rin).
mestre(kakashi, naruto).
mestre(kakashi, sasuke).
mestre(kakashi, sakura).
mestre(tsunade, sakura).
mestre(orochimaru, sasuke).
mestre(orochimaru, kabuto).
mestre(guy, lee).
mestre(guy, neji).
mestre(guy, tenten).
mestre(kurenai, hinata).
mestre(kurenai, kiba).
mestre(kurenai, shino).
mestre(asuma, shikamaru).
mestre(asuma, ino).
mestre(asuma, choji).
mestre(naruto, konohamaru).
% Exercício 1.1: Boruto foi treinado por Sasuke e por Naruto
mestre(sasuke, boruto).
mestre(naruto, boruto).

% Fatos: Natureza do chakra (ninja, elemento)
natureza(naruto, vento).
natureza(sasuke, fogo).
natureza(sasuke, raio).
natureza(sakura, terra).
natureza(kakashi, raio).
natureza(kakashi, agua).
natureza(kakashi, terra).
natureza(jiraiya, fogo).
natureza(jiraiya, terra).
natureza(hiruzen, fogo).
natureza(hiruzen, terra).
natureza(hashirama, terra).
natureza(hashirama, agua).
natureza(tobirama, agua).
natureza(obito, fogo).
natureza(itachi, fogo).
natureza(itachi, agua).
natureza(asuma, vento).
natureza(gaara, vento).
natureza(deidara, terra).
natureza(deidara, raio).
natureza(kisame, agua).
natureza(boruto, raio).
natureza(boruto, vento).

% Fatos: Clã (ninja, cla)
cla(naruto, uzumaki).
cla(nagato, uzumaki).
cla(boruto, uzumaki).
cla(sasuke, uchiha).
cla(itachi, uchiha).
cla(obito, uchiha).
cla(minato, namikaze).
cla(kakashi, hatake).
cla(hashirama, senju).
cla(tobirama, senju).
cla(tsunade, senju).
cla(hiruzen, sarutobi).
cla(asuma, sarutobi).
cla(konohamaru, sarutobi).
cla(hinata, hyuga).
cla(neji, hyuga).
cla(shikamaru, nara).
cla(ino, yamanaka).
cla(choji, akimichi).
cla(kiba, inuzuka).
cla(shino, aburame).

% Fatos: Vila de origem (ninja, vila)
vila(naruto, konoha).
vila(sasuke, konoha).
vila(sakura, konoha).
vila(kakashi, konoha).
vila(jiraiya, konoha).
vila(tsunade, konoha).
vila(hiruzen, konoha).
vila(hashirama, konoha).
vila(minato, konoha).
vila(guy, konoha).
vila(lee, konoha).
vila(hinata, konoha).
vila(shikamaru, konoha).
vila(gaara, suna).
vila(kisame, kiri).
vila(deidara, iwa).
vila(nagato, ame).

% Fatos: Organização (ninja, organizacao)
organizacao(itachi, akatsuki).
organizacao(kisame, akatsuki).
organizacao(deidara, akatsuki).
organizacao(nagato, akatsuki).
organizacao(obito, akatsuki).
organizacao(jiraiya, sannin).
organizacao(tsunade, sannin).
organizacao(orochimaru, sannin).

% Fatos: Invocação (ninja, animal)
invocacao(naruto, sapo).
invocacao(jiraiya, sapo).
invocacao(minato, sapo).
invocacao(tsunade, lesma).
invocacao(orochimaru, cobra).
invocacao(sasuke, falcao).
invocacao(kakashi, cao_ninja).

% Regra 1:
% Aprendiz de elite: discípulo de kakashi OU de sasuke
% E com natureza de chakra raio OU fogo.
aprendiz_de_elite(Ninja) :-
    (mestre(kakashi, Ninja) ; mestre(sasuke, Ninja)),
    (natureza(Ninja, raio) ; natureza(Ninja, fogo)).

%Query 1:
% ?- aprendiz_de_elite(X).
% X = sasuke ; X = sasuke ; X = boruto.
% (sasuke aparece duas vezes porque tem fogo E raio)


%Regra 2:
% Ninja versátil: tem pelo menos duas naturezas diferentes E é da vila konoha.
ninja_versatil(Ninja) :-
    natureza(Ninja, X),
    natureza(Ninja, Y),
    X \= Y,
    vila(Ninja, konoha).

%Query 2:
% ?- ninja_versatil(X).
% X = sasuke ; X = sasuke ; X = kakashi (6x) ; X = jiraiya ; X = jiraiya ;
% X = hiruzen ; X = hiruzen ; X = hashirama ; X = hashirama.
% (repetições: cada par de naturezas X/Y diferente vira uma resposta)


%Regra 3:
% Rivais: mesmo mestre, NÃO são o mesmo ninja E são de clãs diferentes.
rivais(A, B) :-
    mestre(M, A),
    mestre(M, B),
    A \= B,
    cla(A, CA),
    cla(B, CB),
    CA \= CB.

%Query 3:
% ?- rivais(naruto, X).
% X = minato ; X = sasuke.
% (nagato é do mesmo clã uzumaki; sakura não tem clã no banco)


%Regra 4:
% Linhagem: caso base = mestre direto; passo recursivo = mestre de um
% intermediário Z que está na linhagem do discípulo.
linhagem(Mestre, Discipulo) :-
    mestre(Mestre, Discipulo).              % Caso base

linhagem(Mestre, Discipulo) :-
    mestre(Mestre, Z),
    linhagem(Z, Discipulo).                 % Passo recursivo

%Query 4:
% ?- linhagem(jiraiya, X).
% X = minato ; X = nagato ; X = naruto ; X = kakashi ; X = obito ; X = rin ;
% X = naruto ; X = sasuke ; X = sakura ; X = konohamaru ; X = boruto ;
% X = boruto ; X = konohamaru ; X = boruto.
% (naruto, boruto e konohamaru repetem por chegarem por mais de um caminho)