require_relative "woodcutter_story/version"

#encoding: utf-8
require 'nkf'
require 'green_shoes'



class Woodcutter < Shoes
  url '/',                          :index
  url '/prologue',                  :prologue
  url '/departure',                 :departure
  url '/cave',                      :cave
  url '/oval_chamber',              :oval_chamber
  url '/maze',                      :maze
  url '/maze_travel',               :maze_travel
  url '/ending',                    :ending

@@backpack = []

# The index page
  def index
        background antiquewhite
          stack margin: 20 do
          @@backpack.clear
            title "Pustolovščina mladega gozdarja".upcase, :align => "center"
            image "woodcutter_story/images/woodcuter.png", height: 350, width: 350, center: true

            flow do
                image "woodcutter_story/images/question.png", margin: 20, height: 100, width: 100, :click => proc {
                window title: "Navodila", margin: 35, width: 700, height: 800 do
                    background antiquewhite
                    title "Navodila".upcase, :align => "center"
                    
                    para "1.\tPred teboj je zgodba o pustolovščini mladega gozdarja.
\tTvoja naloga je, da mu pomagaš osvojiti princesko.
\tS kliki na sličice pomagaš gozdarju na njegovi poti.

2.\tna njegovi poti mu lahk pomagaš pri različnih odločitvah, tako da
\tklikneš na različne sličice.

3.\tS kliki na puščice se pomikaš med posameznimi poglavji pravljice.

4.\tLegenda sličic:".upcase

                    flow do
                      stack margin: 5, width: 200, height: 200 do
                      border red, strokewidth: 3
                      image "woodcutter_story/images/question.png", margin: 20, height: 80, width: 80
                      caption "Navodila".upcase
                      end

                      stack margin: 5, width: 200, height: 200 do
                      border red, strokewidth: 3
                      image "woodcutter_story/images/help.png", margin: 20, height: 80, width: 80
                      caption "Pomaga nekomu".upcase
                      end

                      stack margin: 5, width: 200, height: 200 do
                      border red, strokewidth: 3
                      image "woodcutter_story/images/not_help.png", margin: 20, height: 80, width: 80
                      caption "Ne pomaga".upcase
                      end

                      stack margin: 5, width: 200, height: 200 do
                      border red, strokewidth: 3
                      image "woodcutter_story/images/next.png", margin: 20, height: 80, width: 80
                      caption "Naslednje poglavje".upcase
                      end

                      stack margin: 5, width: 200, height: 200 do
                      border red, strokewidth: 3
                      image "woodcutter_story/images/start_over.png", margin: 20, height: 80, width: 80
                      caption "Ponovno začni dogodivščino".upcase
                      end
                    end

                end
                }
                image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
                visit '/prologue'}
            end
          end
  end

# First chapter
  def prologue
    flow do
        subtitle "Mladi gozdar".upcase, :align => "center", margin: 20
        background antiquewhite
          stack margin: 20 do
          para "Nekoč je živel mlad gozdar, ki je bil zaljubljen v princesko
njegovega kraljestva. Videl jo je samo od daleč, na sejmih,
ki so jih prirejali na gradu, kjer je prodajal svoje izdelke
iz lesa.".upcase, :align => "center"

            image "woodcutter_story/images/castle.png", height: 350, width: 350, center: true

            para "O tem, da bi jo obiskal in se z njo pogovarjal, je lahko
samo sanjal, saj je bil le navaden gozdar in ne princ. Ni pa vedel, da je tudi
princeska opazila njega.

Živel je v koči sredi gozda, kjer je prebil večino svojega časa,
zaposlen s sekanjem dreves in drugimi gozdnimi opravili.".upcase, :align => "center"

            image "woodcutter_story/images/cabin.png", height: 350, width: 350, center: true

            para "Ko se je nekoč vračal domov, se je ustavil v bližnji krčmi. Tam je
slišal, kako so se pogovarjali o skrivnostnem zakladu, ki naj bi bil
skrit v strašnem podzemnem labirintu. Takrat je dobil idejo: če bi
našel zaklad in se s tem dokazal, bi mu kralj gotovo dovolil
obiskati princesko.

V krčmi je izvedel, da se podzemni labirint nahaja pod goro, ki je
od njegovega doma oddaljena 3 dni hoda.".upcase, :align => "center"

            image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/departure'}
          end
    end
  end

# Second chapter
  def departure
  background antiquewhite
    flow do
    subtitle "Odhod od doma".upcase, :align => "center", margin: 20
        background antiquewhite
          departure_stack = stack margin: 20 do

            para "Gozdar se je odločil, da bo poskusil poiskati zaklad.
Preden pa se odpravi na pot, mu pomagaj izbrati stvari,
ki jih bo vzel s seboj, da bo lažje našel zaklad.
V nahrbtniku ima prostor za 3 predmete. Izberi tiste 3, ki naj
jih vzame s seboj.".upcase, :align => "center"


        # Items to take on the adventure
            apple = "woodcutter_story/images/apple.png"
            water = "woodcutter_story/images/flask.png"
            torch = "woodcutter_story/images/torch1.png"
            rope = "woodcutter_story/images/rope.png"
            slingshot = "woodcutter_story/images/slingshot.png"

            images_items = [apple, water, torch, rope, slingshot]

para "***".upcase, :align => "center"
        caption "Pomagaj gozdarju izbrati vse, kar bo potreboval na poti.".upcase, :align => "center"
para "***".upcase, :align => "center"

        para "1. jabolko \t2. voda  3. bakla  \t4. vrv \t5. frača".upcase
                  flow do
                  background antiquewhite
                    images_items.each do
                     |i| image i, margin: 10, height: 80, width: 80, :click => proc {
                        if @@backpack.include? i
                          alert ("Ta predmet je že v nahrbtniku!".upcase)
                        elsif @@backpack.length >= 3
                          alert ("Nahrbtnik je že poln.".upcase)
                        else
                          @@backpack << i
                        end
                      }
                    end
                  end

para "Nahrbtnik".upcase
                      @backpack_clicked = false
                      image "woodcutter_story/images/backpack.png", margin: 10, height: 80, width: 80, :click => proc {
                        
                      if @@backpack.length == 0
                          alert ("Nahrbtnik je prazen".upcase)
                      else
                            if @backpack_clicked == false
                                  departure_stack.append {flow do
                                  background antiquewhite
                                  border red, strokewidth: 3
                                  @@backpack.each { |i| image i, margin: 10, height: 80, width: 80}
                                  end
                                  }
                                @backpack_clicked = true
                            else
                                alert ("Nahrbtnik je že odprt").upcase
                            end
                      end
                      }
          end
    end
            flow do
            background antiquewhite
            image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/cave'}
            end
  end

# Third chapter
  def cave
  background antiquewhite
    flow do
    subtitle "Jama z labirintom".upcase, :align => "center", margin: 10
      background antiquewhite
        stack margin: 10 do

        para "Po treh dneh hoda je prišel do gore z labirintom in do vhoda v jamo.".upcase, :align => "center"

        image "woodcutter_story/images/cave1.png", height: 350, width: 350, center: true

          if @@backpack.any? {|item| item =~ /torch/}
            para "Notranjost jame je bila zavita v temo. Gozdar ni videl niti
enega metra pred seboj. Še dobro, da je s seboj vzel baklo.
Prižgal jo je in vstopil v jamo. Po dobri uri hoje je prišel do
strmega spusta navzdol.".upcase, :align => "center"

                   if @@backpack.any? {|item| item =~ /rope/}
                      para "Ker je vzel s seboj vrv, se je odločil,
da se bo poskusil po strmini spustiti kar s pomočjo vrvi.
Privezal jo je na skalo in vrgel po strmini.
Po 15 minutah je dosegel dno. Šele zdaj je videl,
da je v veliki ovalni dvorani.".upcase, :align => "center"

            image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/oval_chamber'}

                   else
                      para "Ker ni imel vrvi, je moral ubrati drugo pot.
Odločil se je, da bo poskusil zaobiti strmino po levi
strani. Spustil se je v ozek rov z veliko zavoji.
Na koncu ga je čakal majhen prostor, ki se je razdelil na tri hodnike.
Prišel je do vhoda v labirint!".upcase, :align => "center"

            image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/maze'}
            
                   end
          else
            para "Notranjost jame je bila zavita v temo. Gozdar ni
videl niti enega metra pred seboj. Ker ni vzel bakle,
je v jamo vstopil v temi. Nekaj časa je taval v temi,
potem pa je spoznal, da brez bakle ne more naprej.
Odločil se je, da se gre domov, da se ne bi za vedno
izgubil v jami.".upcase, :align => "center"
        
            image "woodcutter_story/images/start_over.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/'}
          end
        end
    end
  end

# Fourth chapter - oval chamber
  def oval_chamber
  background antiquewhite
    flow do
    subtitle "Ovalna dvorana".upcase, :align => "center", margin: 20
      background antiquewhite
        stack margin: 20 do

          para "Začel je raziskovati ovalno dvorano. Kmalu je prišel do
nekakšnih velikih kamnitih vrat. Približal se je, da bi
jih poskušal odpreti, ko je na vratih prebral naslednje besedilo.

Če hočeš priti do zaklada, moraš rešiti naslednjo uganko.
Na vratih je bila izpisana uganka, pod njo pa so bili nekakšni kamniti
gumbi, ki so predstavljali rešitve. Izbrati mora pravo.".upcase, :align => "center"


          riddles = {
          1 => "V vodi živi, žabica ni. Brez rok brez nog plava naokrog.",
          2 => "Zemljico žejno zaliva, strehe in ceste pomiva. Žaba veselo kriči: Oj, le še padaj, tri dni!",
          3 => "Uhlji dolgi, zajec ni! Tovor nosi, polžek ni! Kadar najbolj se mudi, trmoglavo obstoji.",
          4 => "Zjutraj vstaja, zvečer zahaja.",
          5 => "Roža raste više, više, kakor sonce se ti zdi. Ko nje seme dozori, rada ptičke pogosti!",
          6 => "Dolgouhec potepuhec venomer skaklja sem in tja sem in tja.",
          7 => "Z repom košatim mahlja, z veje na vejo skaklja.",
          8 => "Smrček privihan, rep pa košat. Pravi, da pojde h kuricam spat. Zjutraj pa kuric ni na dvorišče, perje ostalo je le za prgišče. Kurice vzela je drzna tatica, v gozdu jih snela je zvita:",
          9 => "Zelene so njene hlače. Še više kot bolha skače. Za dom ji je blatna mlaka. Ponoči pa glasno kvaka",
          10 => "Majhen je, drobán, a tako močan kakor nihče drug. Brez vsakih muk hišo si oprta. Glej ga! – Sredi vrat.",
          11 => "V kotu pod stropom ribič preži, v mrežo prav tanko nekaj lovi. Pa kaj? Saj ribic tu ni! O, pa so muhe debele in suhe, te on lovi.",
          12 => "Na gnoju stoji, za putke skrbi, ko se zdani, se oglasi: kikiriki",
          13 => "Spomladi se prvi zbudi, z glavico belo neslišno zvoni.",
          14 => "Od jutra do noči hiti, hiti, hiti. Spušča s cveta se na cvet in nabira sladki med.",
          15 => "Pisana krila se v soncu bleščijo, ko se po zraku lovijo. Pisana krila se v soncu bleščijo, ko se na rože spustijo.",
          }



      @riddle = rand(1..15)
      puts @riddle
      subtitle "***", :align => "center"
      caption riddles[@riddle].upcase, :align => "center"
      subtitle "***", :align => "center"

      fish = "woodcutter_story/images/fish.png"
      rain = "woodcutter_story/images/rain.png"
      donkey = "woodcutter_story/images/donkey.png"
      sun = "woodcutter_story/images/sun.png"
      sunflower = "woodcutter_story/images/sunflower.png"
      rabbit = "woodcutter_story/images/rabbit.png"
      squirrel = "woodcutter_story/images/squirrel.png"
      fox = "woodcutter_story/images/fox.png"
      frog = "woodcutter_story/images/frog.png"
      snail = "woodcutter_story/images/snail.png"
      spider = "woodcutter_story/images/spider.png"
      rooster = "woodcutter_story/images/rooster.png"
      snowdrop = "woodcutter_story/images/snowdrop.png"
      bee = "woodcutter_story/images/bee.png"
      butterfly = "woodcutter_story/images/butterfly.png"

      images_riddle = {1 => fish, 2 => rain, 3 => donkey, 4 => sun, 5 => sunflower,
      6 => rabbit, 7 => squirrel, 8 => fox, 9 => frog, 10 => snail,
      11 => spider, 12 => rooster, 13 => snowdrop, 14 => bee, 15 => butterfly}

                  flow do
                  background antiquewhite
                    @riddle_clicked = false
                    images_riddle.each do
                     |k, i| image i, margin: 10, height: 80, width: 80, :click => proc {
                       if @riddle_clicked == false
                            @riddle_solution = k

                            #SOLVES_RIDDLE
                                if @riddle_solution == @riddle
                  append {
                  flow do
                  background antiquewhite
                  subtitle "***", :align => "center"
                  para "Velika kamnita vrata se odprejo in gozdar je na sredi majhne dvorane
na kamnitem podstavku zagledal velik rdeč rubin.".upcase, :align => "center"

image "woodcutter_story/images/ruby.png", height: 80, width: 80, center: true

para "Pospravil ga je v nahrbtnik in se odpravil domov.".upcase, :align => "center"
subtitle "***", :align => "center"

                    image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
                    visit '/ending'}
                    end}

                            # DOESNT_SOLVE_RIDDLE
                                else
                  append {
                  flow do
                  background antiquewhite
                  subtitle "***", :align => "center"
                  para "Rešitev uganke ni bila pravilna. Okrog gozdarja se je pojavil bleščeč
obroč. Neznana čarobna moč ga je v trenutku iz ovalne dvorane
prenesla nazaj pred njegovo kočo.".upcase, :align => "center"
subtitle "***", :align => "center"

                    image "woodcutter_story/images/start_over.png", margin: 20, height: 100, width: 100, :click => proc {
                    visit '/'}
                    end}
                                            @clicked = 0
                                end
                        else
                          alert ("Poskus za reševanje uganke si že porabil!").upcase
                      end
                        @riddle_clicked = true
                      }
                    end
                  end
        end
    end
  end

# Maze
  def maze
  background antiquewhite
    flow do
    subtitle "Labirint".upcase, :align => "center", margin: 20
      background antiquewhite
        flow do

          para "Ni vedel v kateri hodnik je pravi. Bal se je, da se bo za vedno izgubil.
Ravno, ko se je hotel obrniti in se vrniti, je zaslišal tiho
stokanje. Sledil je glasu in prišel do majhne vdolbine v eni izmed
sten, kjer je ležala majhna miška.

Rekla je: \"Prosim te, pomagaj mi.\"
Gozdar jo je vprašal: \"Kaj potrebuješ?\"

Miška mu je odgovorila, da že tri dni ni ničesar jedla ali pila in
je tako slabotna, da se ne more vrniti domov.".upcase, :align => "center"

para "***".upcase, :align => "center"
          caption "Ali naj gozdar pomaga miški?".upcase, :align => "center"
para "***".upcase, :align => "center"

            items = /flask|apple/
            @decision = false
                  if @@backpack.any? {|item| item =~ items}
                          image "woodcutter_story/images/help.png", margin: 10, height: 80, width: 100, :click => proc {
                            background antiquewhite
                            if @decision == false
                              append {image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc { visit '/maze_travel'}}
                              @decision = true
                            else
                              alert ("Gozdar se je že odločil, nadaljuj s pustolovščino!").upcase
                            end
                              }

                          image "woodcutter_story/images/not_help.png", margin: 10, height: 80, width: 100, :click => proc {
                            background antiquewhite
                            if @decision == false
                              append { para "Gozdar se je odločil, da nima časa za pomoč miški. Poleg tega
bo morda sam kasneje potreboval hrano in pijačo. Miško je pustil tam,
kjer jo je našel in dejal, da ji bo pomagal, ko se bo vračal.

Ko je vstopil v labirint, ni našel več poti nazaj, pa tudi do
zaklada ni prišel. Za vedno se je izgubil. ".upcase, :align => "center"}

                              append {image "woodcutter_story/images/start_over.png", margin: 20, height: 100, width: 100, :click => proc {visit '/'}}
                              @decision = true
                            else
                              alert ("Gozdar se je že odločil, nadaljuj s pustolovščino!").upcase
                            end
                            }
                  else
                      para "Gozdar ni vzel s seboj ne jabolka in ne vode,
zato ni mogel pomagati miški.".upcase, :align => "center"
                  end
        end
    end
  end


# Maze travel
  def maze_travel
  background antiquewhite
    flow do
    subtitle "Hoja po labirintu".upcase, :align => "center", margin: 20
      background antiquewhite
        stack margin: 20 do
          para "Gozdar je pomagal miški in za nagrado se mu je usedla na rame
in ga vodila skozi zapleten labirint. Če bi sam poskušal priti
skozi, bi se zagotovo izgubil.
Ko sta prišla do ovalne dvorane, ga je miška pustila samega
in odšla nazaj k svoji družini.".upcase, :align => "center"

image "woodcutter_story/images/maze.png", height: 250, width: 250, center: true

            image "woodcutter_story/images/next.png", margin: 20, height: 100, width: 100, :click => proc {
            visit '/oval_chamber'}
        end
    end
  end


# Ending
  def ending
  background antiquewhite
    flow do
    subtitle "In živela sta srečno...".upcase, :align => "center", margin: 20
      background antiquewhite
        stack margin: 20 do
          para "Ko se je gozdar vrnil domov, je obiskal princesko na dvoru.
Kralj najprej ni dovolil, da bi gozdar videl princesko.

Ko pa mu je gozdar povedal o svoji pustolovščini in o zakladu,
se je kralj takoj premislil. V zameno za zaklad je dovolil,
da je šel gozdar obiskat princesko.

Princeska se je gozdarja zelo razveselila.".upcase, :align => "center"

image "woodcutter_story/images/hearts.png", height: 150, width: 150, center: true

para "Gozdar se je odločil, da bo kralja prosil za roko njegove hčere.
Bil je prepričan, da bo kralj privolil, saj je gozdar dokazal,
da je pogumen, pa tudi zaklad mu je prinesel.

Kralj pa se je razjezil in je dejal, da se nikoli ne bo smel poročiti s
princesko, ker ni princ, ampak navaden gozdar.

Ko je princeska to slišala, se je tudi ona razjezila. Kralju
je rekla, da je gozdar najbolj pogumen in bolj plemenit
kot vsi princi na svetu. Tako je zapustila grad in odšla
živet k gozdarju. Živela sta dolgo in srečno do konca svojih dni.".upcase, :align => "center"

image "woodcutter_story/images/start_over.png", margin: 20, height: 100, width: 100, :click => proc {visit '/'}
        end
    end
  end

end

Shoes.app title: "Mladi gozdar", width: 800, height: 900

