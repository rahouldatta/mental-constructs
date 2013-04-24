module Searcher

  def exists_somewhere?(provided_text,search_text)
    there = false
    if complete_search_text_exists?(provided_text,search_text)
      return true
    else
      there = search_word_by_word(provided_text,search_text)
      return there
    end
  end

  def complete_search_text_exists?(provided_text,search_text)
    consider_all_punctuation_possibilities(provided_text,search_text)
  end

  def search_word_by_word(provided_text,search_text,there = [])
    search_text.split(' ').each do |word|
      consider_all_punctuation_possibilities(provided_text,word) ?
          there << true : there << false
    end
    there.include?(true)
  end

  def consider_all_punctuation_possibilities(provided_text,search_text)
    provided_text.include?(search_text.downcase) or provided_text.include?(search_text.capitalize) or provided_text.include?(search_text.upcase)
  end

end