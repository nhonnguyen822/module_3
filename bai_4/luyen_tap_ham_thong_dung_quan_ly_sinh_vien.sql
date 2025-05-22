use quan_ly_sinh_vien;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select s.* from subjects s
where s.credit=(select max(s.credit) from subjects s);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select s.* from subjects s join mark m on s.id=m.sub_id
where m.mark=(select  max(m.mark) from mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.*,avg(m.mark) as dbt_hs from students s join mark m on s.id= m.student_id
group by s.id
order by dbt_hs
