SELECT 
    s.name AS student_name,
    s.phone_num AS student_phone,
    s.email AS student_email,
    s.birth AS student_birth,
    
    t1.name AS teacher1_name,
    sub1.subject AS teacher1_subject,
    
    t2.name AS teacher2_name,
    sub2.subject AS teacher2_subject,
    
    p.name AS parent_name,
    p.phone_num AS parent_phone,
    
    sch.name AS school_name,
    
    GROUP_CONCAT(h.hobby ORDER BY h.hobby) AS hobbies -- 취미는 여러 개일 수 있기 때문에 GROUP_CONCAT을 사용하여 취미 목록을 하나의 문자열로 연결
FROM 
    Student s
JOIN 
    Parent p ON s.parent_id = p.id
JOIN 
    School sch ON s.school_id = sch.id
LEFT JOIN 
    Student_Teacher st1 ON s.id = st1.student_id AND st1.teacher_id = t1.id
LEFT JOIN 
    Teacher t1 ON st1.teacher_id = t1.id
LEFT JOIN 
    Subject sub1 ON t1.subject_id = sub1.id
LEFT JOIN 
    Student_Teacher st2 ON s.id = st2.student_id AND st2.teacher_id = t2.id
LEFT JOIN 
    Teacher t2 ON st2.teacher_id = t2.id
LEFT JOIN 
    Subject sub2 ON t2.subject_id = sub2.id
LEFT JOIN 
    Student_Hobby sh ON s.id = sh.student_id
LEFT JOIN 
    Hobby h ON sh.hobby_id = h.id
GROUP BY 
    s.id, p.id, sch.id
ORDER BY 
    s.name;
