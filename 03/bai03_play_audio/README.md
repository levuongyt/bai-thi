# bai03_play_audio

## Mô tả :
Ứng dụng đọc sách cho phép phát âm thanh đọc một bài văn đồng thời đánh dấu từ đang được phát âm. Khi âm thanh được phát, từ trong bài văn sẽ được bôi vàng để hiển thị từ hiện tại đang được phát âm.

## Cách giải quyết: 

1. Thêm file audio và Json dữ liệu vào dự án
2. Tạo model BookModel để xử lý dữ liệu Json
  - BookModel chứa thông tin về văn bản và danh sách các thời điểm từ được phát âm.
  - Timestamp chứa thông tin về thời gian đã trôi qua, thời gian phát âm của từ, vị trí bắt đầu của từ và độ dài của từ.
3. Quản lý trạng thái và logic phát âm thanh của ứng dụng bằng Controller
  - Khởi tạo dữ liệu với dữ liệu được lấy từ file Json.
  - Lấy dữ liệu âm thanh của file audio thông qua thư viện audioplayers.
  - Sử dụng Timer có chu kỳ 1 milisecond để đồng bộ hóa việc đánh dấu từ với thời gian phát âm của âm thanh. So sánh thời gian hiện tại âm thanh đang được phát với khoảng thời gian từ được phát âm trong dữ liệu timestamp.
4. Tạo giao diện ứng dụng để hiển thị văn bản và từ đánh dấu
  - Sử dụng Obx để lắng nghe và cập nhật trạng thái từ đang được phát âm.
  - Sử dụng RichText và TextSpan để bôi vàng từ hiện tại đang được phát âm.

Prompt AI
 - Cách lấy dữ liệu và phát âm thanh từ file audio trong flutter.
 - Cách sử dụng audioplayers để phát âm thanh.
 - Cách lấy thời gian hiện tại của file âm thanh đang phát.

## Giao diện ứng dụng:

![image](https://github.com/user-attachments/assets/979ec52a-fa9a-449a-8240-2646a7a9ed77)
