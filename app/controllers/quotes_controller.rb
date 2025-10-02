class QuotesController < ApplicationController
  def index
    # Array of beautiful spiritual quotes
    @quotes = [
      "The present moment is the only time over which we have dominion. - Thich Nhat Hanh",
      "Peace comes from within. Do not seek it without. - Buddha",
      "Be yourself; everyone else is already taken. - Oscar Wilde",
      "The mind is everything. What you think you become. - Buddha",
      "Happiness is not something ready made. It comes from your own actions. - Dalai Lama",
      "The only way to do great work is to love what you do. - Steve Jobs",
      "In the end, only three things matter: how much you loved, how gently you lived, and how gracefully you let go of things not meant for you. - Buddha",
      "The wound is the place where the Light enters you. - Rumi",
      "Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself. - Rumi",
      "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb"
    ]
    
    # Pick a random quote to show
    @current_quote = @quotes.sample
  end
end
