require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = generate_letter
  end

  def score
    @word = params[:word].upcase

    @grid = params[:list]

    grid_array = @grid.gsub('"', '').gsub(']', '').gsub('[', '').split(',')
    grid_array_strip = []

    grid_array.each do |letter|
      grid_array_strip << letter.strip
    end
    @result = run_game(@word, grid_array_strip)

    @score = @result[:score]
  end

  private

  def generate_letter
    # TODO: generate random grid of letters
    array_result = []

    10.times do |_i|
      array_result.push(rand(65..90).chr)
    end

    array_result
  end

  def run_game(attempt, grid)
    # TODO: runs the game and return detailed hash of result (with `:score`, `:message` and `:time` keys)
    testing_english_word = english_word?(attempt)
    p testing_english_word

    testing_comparaison = included?(attempt, grid)
    p testing_comparaison
    score = 0
    if testing_english_word == false
      message = 'This is not an english word ... Loser'
    elsif testing_comparaison == false
      message = "You can't make this word, not in the grid"
    else
      score = (grid.length - attempt.length)
      message = 'Well done you make it work.'
    end
    { score: score, message: message }
  end

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def included?(guess, grid)
    p guess
    p grid
    guess.chars.all? { |letter| guess.count(letter) <= grid.count(letter) }
  end
end
