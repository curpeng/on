# frozen_string_literal: true

class BatchLoader
  def initialize(result)
    @result = result
  end

  def find_each(&block)
    current_page_records = @result.current_page
    current_page_records.each(&block)

    while @result.has_next_page? do
      @result = @result.next_page
      current_page_records = @result.current_page
      current_page_records.each(&block)
    end
  end
end
