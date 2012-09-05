# coding: utf-8
require File.expand_path(File.join(%w[config boot]), File.dirname(__FILE__))
require "forgery"

TYPES = %w[Prova Trabalho Lista Livro Apostila Slides]
# DISCIPLINES = ["Banco de Dados", "Engenharia de Software", "Compiladores", "Física", "Geometria Analítica", "Formação Empreendedora", "Computação Gráfica", "Processamento de Imagem", "Introdução a Arquitetura de Computadores"]
# TEACHERS = ["Fabiana Frata", "Roberto Gil Brasil", "Jorge Habib", "Antonio Massao (Shiro)", "Ricardo Krauskopf"]

namespace :db do
  desc "Populate  database with disciplines"
  task :disciplines do
    disciplines = [
      "Banco de Dados",
      "Compiladores",
      "Engenharia de Software I",
      "Engenharia de Software II",
      "Introdução à Arquitetura de Computadores",
      "Processamento de Imagens",
      "Computação Gráfica"
    ].each do |discipline|
      Discipline.create(name: discipline)
    end
  end

  desc "Populate  database with teachers"
  task :teachers do
    disciplines = [
      "Roberto Gil Brasil",
      "Fabiana Frata",
      "Jorge Habib",
      "Eliane Pereira",
      "Antonio Massao",
      "Teresinha Arnauts"
    ].each do |teacher|
      Teacher.create(name: teacher)
    end
  end

  desc "Populate database with some fake data"
  task :populate do
    1.upto 10 do
      type = TYPES.sample
      discipline = Discipline.skip(rand(Discipline.count)).limit(1).first
      teacher = Teacher.skip(rand(Teacher.count)).limit(1).first
      ext = %w[pdf jpg odt zip doc docx].sample
      a = Archive.create(
        name: "#{type} de #{discipline.name}",
        description: Forgery(:lorem_ipsum).words(12),
        path: "/tmp/file.#{ext}",
        filesize: Forgery(:basic).number(at_least: 1234, at_most: 887261),
        year: [2009, 2010, 2011, 2012].sample,
        teacher: teacher,
        discipline: discipline
      )
    end
  end
end