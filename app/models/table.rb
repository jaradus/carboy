module Table

  def self.table(exclude_headers = [])
    # Requests items from the database
    @items = self.name.all
    raw_header = self.name.column_names()
    # Gets table headers, and removes database-specific information
      @items_header = []
      raw_header.each do |header|
        unless exclude_headers.include? header
          @items_header << header
        end
      end
  end

end