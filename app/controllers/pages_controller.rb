class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @lists = [
      { title: "Cena Navideña", tags: ["Navidad", "Cena", "Festivo"], path: "/lists/cena_navidena" },
      { title: "Fiesta", tags: ["Fiesta", "Celebración", "Entretenimiento"], path: "/lists/fiesta" },
      { title: "Velorio", tags: ["Funeral", "Condolencias"], path: "/lists/velorio" },
      { title: "Cumpleaños", tags: ["Cumpleaños", "Celebración", "Fiesta"], path: "/lists/cumpleanos" }
    ]
  end
end
