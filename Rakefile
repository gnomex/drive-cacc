# coding: utf-8
require File.expand_path(File.join(%w[config boot]), File.dirname(__FILE__))
require "forgery"

TYPES = %w[Prova Trabalho Lista Livro Apostila Slides]
DISCIPLINES = ["Banco de Dados", "Engenharia de Software", "Compiladores", "Física", "Geometria Analítica", "Formação Empreendedora", "Computação Gráfica", "Processamento de Imagem", "Introdução a Arquitetura de Computadores"]
TEACHERS = ["Fabiana Frata", "Roberto Gil Brasil", "Jorge Habib", "Antonio Massao (Shiro)", "Ricardo Krauskopf"]

desc "Populate Database with some data"
task :populate do
  1.upto 20 do
    type = TYPES.sample
    discipline = DISCIPLINES.sample
    teacher = TEACHERS.sample
    Archive.create(
      filename: "#{type} de #{discipline}",
      description: Forgery(:lorem_ipsum).words(12),
      path: "/tmp/prova_bd.rar",
      filesize: Forgery(:basic).number(at_least: 1234, at_most: 887261),
      year: [2009, 2010, 2011, 2012].sample,
      discipline: discipline,
      teacher: teacher
    )
  end
end