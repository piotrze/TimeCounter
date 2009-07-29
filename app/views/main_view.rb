class MainView < ApplicationView
  use_builder
  @@counter = 0
  @@start_time = nil


  # Add your stuff here.

  on :start_button, 'clicked' do |widget|
    if @@start_time.nil?
      @@start_time = Time.now 
      self.message_label.text = "Zaczołeś: #{@@start_time}"
    end

  end

  on :stop_button, 'clicked' do |widget|
    length = (Time.now - @@start_time)/60/60
    file = File.open('/home/diego/dokumenty/oficjalne/ts_program.txt', 'a') { |i|  
      i.puts("#{Time.now.strftime("%d.%m.%Y")} | #{length} | #{self.comment_entry.text}")
    }
    self.message_label.text = "pracowałeś: #{length} godz."

  end
end
