module FlashNotificationHelper
    def flash_notification
      flash_messages = []
  
      flash.each do |type, message|
        next unless message
        notification = content_tag(:div, safe_join([raw(message)]), class: "toast toast-#{type} mb-5")
        flash_messages << notification
      end
  
      safe_join(flash_messages)
    end
  end