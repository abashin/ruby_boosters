class Player
  attr_reader :player_last_name
  attr_reader :player_first_name
  attr_reader :player_rating
  attr_reader :player_age

  def info
    puts "Возраст игрока: player_age"
    puts "Имя игрока: fplayer_first_name"
    puts "Фамилия игрока : player_last_name"
    puts "Рейтинг игрока: player_rating"
  end

  def player_name
    puts "Собщает на сервер имя и фамилию игрока"
  end

  def player_rating
    puts "Сообщает на сервер рейтинг игрока"
  end

  def player_age
    puts "Сообщает на сервер возраст игрока"
  end
end

class Game
  attr_reader :player_move_piece
  attr_reader :enemy_move_piece

  def info
    puts "Ход игрока player_move_piece"
    puts "Ход соперника enemy_move_piece"
  end

  def ready_to_start
    puts "Сообщает на сервер о том, что игрок готов начинать игру, как только появится соперник"
  end

  def start
    puts "Сообщает игроку о начале игры"
  end

  def black_or_white
    puts "Сообщает игроку о цвете его фигур "
  end

  def player_step
    puts "Сообщает о шаге игрока серверу"
  end

  def enemy_step
    puts "Сообщает игроку о шаге противника"
  end
end

class Piece
  attr_reader :piece_location
  attr_reader :piece_blackorwhite
  attr_reader :piece_deadoralive
  attr_reader :piece_type
  def into
    puts "сама фигура piece_type"
    puts "координаты фигуры piece_location"
    puts "цвет клетки, на которой стоит фигура piece_blackorwhite"
    puts "есть ли фигура на доске piece_deadoralive"
  end

  def piece_location
    puts "сообщает серверу о координатах фигуры"
  end

  def piece_blackorwhite
    puts "сообщает серверу о цвете клетки, на которой стоит фигура"
  end

  def piece_deadoralive
    puts "сообщает серверу есть ли фигура на доске"
  end

  def piece_type
    puts "сообщает серверу о типе фигуры"
  end
end