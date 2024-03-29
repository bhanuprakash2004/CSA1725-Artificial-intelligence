
teaches_subject(teacher1, math, 'MAT101').
teaches_subject(teacher2, physics, 'PHY201').
teaches_subject(teacher3, computer_science, 'CSC301').

enrolled_in_subject(mahesh, 'MAT101').
enrolled_in_subject(lakshmi, 'PHY201').
enrolled_in_subject(yach, 'CSC301').
enrolled_in_subject(prakash, 'MAT101').

teacher_of_subject(SubjectCode, Teacher) :-
    teaches_subject(Teacher, _, SubjectCode).

students_in_subject(SubjectCode, Students) :-
    findall(Student, enrolled_in_subject(Student, SubjectCode), Students).
