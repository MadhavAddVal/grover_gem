require 'grover'
require 'date'
require 'erb'


# Define the data to be used in the PDF
pdf_data = {
    name: "Madhav",
    date: Date.today
}

# Read the HTML layout file
file_layout = File.read('file.html.erb')

# Create an ERB instance
erb_layout = ERB.new(file_layout)

# Render the ERB template with the data
html_layout = erb_layout.result_with_hash(pdf_data)

# Generate PDF
grover = Grover.new(html_layout)
pdf = grover.to_pdf


# Write the PDF to a file
File.open('generated.pdf', 'wb') do |f|
    f.write(pdf)
end

puts 'PDF generated successfully as output.pdf'

# Run the script
# ruby generate_pdf.rb