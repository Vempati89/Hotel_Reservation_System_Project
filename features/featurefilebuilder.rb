require 'csv'

def buildFeaturefiles

  CSV.foreach(File.path("C:/Workspace/features.csv")) do |row|
    classstring = ''
    aname = row[0]
    afeature = row[1]
    #  ascenario = row[2]

    classstring.concat( "@not_ready\n")
    classstring.concat( "Feature: '#{afeature}'\n\n")
    classstring.concat( "Background:\n\n")
    classstring.concat( "    Given Banker is logged in with CSR role and data xyz")
    #  classstring.concat( "@not_ready\n")
    #  classstring.concat( "# TODO  Scenario: #{aname}: #{ascenario}\n\n")

    file = File.open("C:/Workspace/features/#{aname}.feature", "w")
    file.puts classstring
    file.close unless file.nil?

  end

end