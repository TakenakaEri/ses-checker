module ApplicationHelper
    def flash_background_color(type)
        case type.to_sym
        when :notice then "bg-ses-cyan border-blue-500"
        when :alert  then "bg-mint border-green-500"
        when :error  then "bg-red-100 border-red-500"
        else "bg-gray-100 border-gray-500"
        end
      end
end
