# -----------------------------------------------------
# Adge Denkers
# adge.denkers@gmail.com
# file name: simple_string_split_example.sh
# date: 2017-08-14
# -----------------------------------------------------

# *************** DOES NOT WORK ***************

#!/usr/bin/env bash

galaxy_list = "Andromeda, Antlia, Apus, Aquarius, Aquila, Ara, Aries, Auriga, Boötes, Caelum, Camelopardalis, Cancer, Canes Venatici, Canis Major, Canis Minor, Capricornus, Carina, Cassiopeia, Centaurus, Cepheus, Cetus, Chamaeleon, Circinus, Columba, Coma Berenices, Corona Australis, Corona Borealis, Corvus, Crater, Crux, Cygnus, Delphinus, Dorado, Draco, Equuleus, Eridanus, Fornax, Gemini, Grus, Hercules, Horologium, Hydra, Hydrus, Indus, Lacerta, Leo, Leo Minor, Lepus, Libra, Lupus, Lynx, Lyra, Mensa, Microscopium, Monoceros, Musca, Norma, Octans, Ophiuchus, Orion, Pavo, Pegasus, Perseus, Phoenix, Pictor, Pisces, Piscis Austrinus, Puppis, Pyxis, Reticulum, Sagitta, Sagittarius, Scorpius, Sculptor, Scutum, Serpens, Sextans, Taurus, Telescopium, Triangulum, Triangulum Australe, Tucana, Ursa Major, Ursa Minor, Vela, Virgo, Volans, Vulpecula";

galaxies = $(echo $galaxy_list | tr ",\ ", "\n")

for galaxy in $galaxies
do
    echo "$galaxy"
done
