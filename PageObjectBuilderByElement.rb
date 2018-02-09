require 'watir'
#arr = ['areas','buttons','checkboxes','divs','forms','frames','hiddens','images','labels','lis','maps','ps','radios','select_lists','select_lists','spans','tables','text_fields']
arr = ['text_fields','radios','select_lists']

browser = Watir::Browser.start 'http://adactin.com/HotelApp/'
sleep(60)
begin
  puts ( 'Enter the page name (done will end the session): ' )
  name = gets().chomp.capitalize
#  name = name
  if name=='Done'
    return
  end
  puts ( 'Enter the div xpath info: ' )
  target = gets().chomp
  bDiv = browser.div(:xpath => target)
  classstring = ""
  classstring.concat("class #{name}\n")
  classstring.concat( "  include PageObject\n")
  classstring.concat("# xpath: #{target}\n\n")

  for elem in arr
    classstring.concat("\n")
    bDiv.send(elem).each do  |e|
      #classstring.concat("# #{e.parent.html.split.join(' ')}\n")
      classstring.concat("# #{e.html.split.join(' ')}\n")
      classstring.concat("#id = #{e.id}; name=  #{e.name}; text=  #{e.text.split.join(' ')}\n")
      classstring.concat("  #{elem.chomp("s")}(:#{e.name.split.join.downcase}, :name => '#{e.name}')\n")
    end
  end
  bDiv.checkboxes.each do  |e|
    #classstring.concat("# #{e.parent.html.split.join(' ')}\n")
    classstring.concat("# #{e.html.split.join(' ')}\n")
    classstring.concat("#id = #{e.id}; name=  #{e.name}; text=  #{e.text.split.join(' ')}: \n")
    classstring.concat( "  checkbox(:#{e.name.split.join.downcase}, :name => \"#{e.name}\")\n")
  end
  bDiv.buttons.each do  |e|
    #classstring.concat("# #{e.parent.html.split.join(' ')}\n")
    classstring.concat("# #{e.html.split.join(' ')}\n")
    classstring.concat("#id = #{e.id}; name=  #{e.name}; text=  #{e.text.split.join(' ')}: \n")
    classstring.concat( "  button(:#{e.text.split.join.downcase}, :text => \"#{e.text}\")\n")
  end
  bDiv.links.each do  |e|
    #classstring.concat("# #{e.parent.html.split.join(' ')}\n")
    classstring.concat("# #{e.html.split.join(' ')}\n")
    classstring.concat("#id = #{e.id}; name=  #{e.name}; text=  #{e.text.split.join(' ')}: \n")
    classstring.concat( "  link(:#{e.text.split.join.downcase}, :href => \"#{e.text}\")\n")
  end
  bDiv.lis.each do  |e|
    #classstring.concat("# #{e.parent.html.split.join(' ')}\n")
    classstring.concat("# #{e.html.split.join(' ')}\n")
    classstring.concat("#id = #{e.id}; text=  #{e.text.split.join(' ')}: \n")
    # lis doesn't support name so name at line 52 was deleted
    classstring.concat( "  link(:#{e.text.split.join.downcase}, :href => \"#{e.text}\")\n")
  end

  classstring.concat( "\n\n")
  classstring.concat( "# page_url ('#{browser.url}')\n\n")
  classstring.concat("end\n")
  file = File.open("#{File.dirname(__FILE__)}/features/support/pages/#{name}.rb", "w")
  file.puts classstring
  file.close unless file.nil?
end while name!="Done"
browser.close


