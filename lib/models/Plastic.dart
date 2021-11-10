enum PlasticType { NONE, PET, PEAD, PVC, PEBD, PP, PS, OTHER }

class Plastic {
  final plasticType;
  String info;
  String imagePath;
  double price;

  Plastic([this.plasticType = PlasticType.NONE]) {
    switch (this.plasticType) {
      case PlasticType.PET:
        this.info =
        "É formado pela reação entre o ácido tereftálico e o etileno"
            " glicol. Muito utilizado em garrafas de água e refrigerante e"
            " comumente reciclado. \n\nEste tipo de plástico é amplamente"
            " utilizado em todo o mundo principalmente por seu baixo "
            "preço e serem leves, inquebráveis e impermeáveis. Além disso "
            "são considerados termoplásticos, ou seja, um tipo de polímero "
            "que pode ser remodelado por meio de um aquecimento seguido "
            "de um resfriamento. As embalagens de PET são identificadas com o "
            "número 1 dentro do triâgulo ";
        this.price = 1;
        this.imagePath = 'assets/plasticTypes/pet.jpg';
        break;
      case PlasticType.PEAD:
        this.info = "São os plásticos rígidos, resistentes e impermeáveis, "
            "utilizados em produtos de limpeza doméstica, higiene, "
            "medicamentos, além de muito presentes nas indústrias. "
            "\n\nO polietileno é um polímero que possui estrutura química "
            "simples obtido por meio da polimerização do eteno. Polietileno "
            "de alta densidade se difere do PEBD por ter uma cadeia polímerica"
            "mais longa. As embalagens de PEAD são identificadas com o "
            "número 2 dentro do triâgulo";
        this.price = 2.5;
        this.imagePath = 'assets/plasticTypes/pead.jpg';
        break;
      case PlasticType.PVC:
        this.info =
        "Polímero que pode ser tanto mais rígido quanto mais flexível, "
            "muito utilizado nos tubos hidráulicos e nas construções civis "
            "por ser pouco inflamável, além de ser muito utilizado também "
            "como revestimento de fios e cabos. \n\nTambém é impermeável e é "
            "obtido a partir da polimerização do cloreto de vinila, daí o nome "
            "PVC, do inglês polyvinyl chloride (poli cloreto de vinila). As"
            " embalagens de PEAD são identificadas com o número 3 dentro do"
            " triâgulo";
        this.price = 50;
        this.imagePath = 'assets/plasticTypes/pvc.jpg';
        break;
      case PlasticType.PEBD:
        this.info =
        "Amplamente utilizado em sacos de lixo e sacolas de supermercado, "
            "filmes para diversos tipos de embalagens, entre outros. Pode formar "
            "películas finas e serem empregadas na fabricação de plástico-filme. "
            "\n\nÉ bastante flexível, leve e de boa resistência. Assim como o "
            "PEAD é formado pela poliemerização do eteno, porém com cadeias"
            "mais curtas. As embalagens de PEBD são identificadas com o "
            "número 4 dentro do triâgulo";
        this.price = 3.8;
        this.imagePath = 'assets/plasticTypes/pebd.jpg';
        break;
      case PlasticType.PP:
        this.info =
        "É obtido a partir da polimerização do propileno e tem diversos "
            "usos como em canudos, tampas de garrafas, tubos para água quente, "
            "seringas, embalagens de iogurte etc... \n\nO PP tem uma variação chamada "
            "de BOPP, aquele plástico metalizado muito utilizado nas embalagens "
            "de biscoitos, que é pouco reciclável. As embalagens de PP são mar-"
            "cadas com o número 5.";
        this.imagePath = 'assets/plasticTypes/pp.jpg';
        this.price = 3.5;
        break;
      case PlasticType.PS:
        this.info =
        "É um polímero obtido, por gás a partir da polimerização do estireno"
            " (PS). A expansão deste com gás dá origem ao popular EPS, muito "
            " conhecido como “isopor”, utilizados em copos e recipientes de"
            " transporte, por exemplo. Mas o PS também é o escolhido para"
            "fabricar copos descartáveis e diveros tipos de embalagem de"
            " alimentos. \n\n O EPS, em epecial apresenta"
            " maior parte de seu volume composto de ar e uma pequena parte do "
            "poliestireno propiamente dito, o que faz com que ele seja leve e"
            " o transporte reverso seja dispendioso, devido ao volume ocupado."
            " Atualmente vem sendo empregado na construção civil, por ser"
            " um bom isolante termico, e dimiinir o peso da estrutura. "
            "\n\n A embalagens de PS são marcadas com o número 6";
        this.price = 2.2;
        this.imagePath = 'assets/plasticTypes/eps.png';
        break;
      case PlasticType.OTHER:
        this.info =
        "Essa categoria refere-se à todos os plásticos criados após 1987. "
            "Possuem usos relativamente recentes porém diversos, sendo "
            "empregados em diversas embalagens, plásticos biodegradáveis etc."
            "\n\n A embalagens que são formadas por esses outros tipos de "
            "plásticos, são marcadas com o número 7";
        break;
      default:
        this.info = "";
    }
  }
}

