on isUIScriptingOn()
	tell application "System Events" to set isUIScriptingEnabled to UI elements enabled
	return isUIScriptingEnabled
end isUIScriptingOn

on turnUIScriptingOn(switch)
	tell application "System Preferences"
		activate
		set securityPane to pane "com.apple.preference.security"
		tell securityPane to reveal anchor "Privacy_Accessibility"
		activate
	end tell
end turnUIScriptingOn

on run
	if not isUIScriptingOn() then
		display dialog "NAKL không thể hoạt động nếu chưa được cấp quyền điều khiển bàn phím. Bạn cần phải kích hoạt bằng cách mở System Preferences > Security & Privacy > Privacy > Accessibility và đánh dấu vào NAKL.
		
Sau khi kích hoạt, bạn cần phải tắt và mở lại NAKL.

Nếu bạn đang dùng phiên bản MacOS cũ hơn 10.9, xin tham khảo thêm thông tin tại http://huyphan.github.io/NAKL/index.html#faq"
		turnUIScriptingOn(true)
	end if
end run