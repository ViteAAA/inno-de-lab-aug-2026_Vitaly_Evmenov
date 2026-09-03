class Trainee:

    def __init__(self, name, surname, score = 0, passing_grade = 10):
        self.name: str = name
        self.surname: str = surname
        self.passing_grade: int = passing_grade
        self.__score: int = score

    @property
    def score(self):
        return self.__score

    @score.setter
    def score(self, new_score: int):
        if not isinstance(new_score, int):
            raise ValueError(f"Expected value of type int, got {type(new_score)}")
        elif new_score < 0:
            raise ValueError(f"The score shouldn't be less than 0!")

        self.__score = new_score

    def do_homework(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_homework(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def visit_lecture(self) -> None:
        """Increases score by 1"""
        self.score += 1

    def miss_lecture(self) -> None:
        """Decreases score by 1"""
        self.score -= 1

    def is_passing(self) -> bool:
        """Check student passes or not"""
        return self.score >= self.passing_grade

class HardworkingTrainee(Trainee):

    def do_homework(self) -> None:
        """Increases score by 2"""
        self.score += 2

class AuditTrainee(Trainee):

    def is_passing(self) -> bool:
        """Returns always Trye"""
        return True

class Cohort:

    def __init__(self, title: str, trainees: list[Trainee] = []):
        self.title: str = title
        self.trainees: list[Trainee] = trainees

    def add_trainee(self, trainee: Trainee) -> None:
        """Adds Trainee in group"""
        self.trainees.append(trainee)

    def conduct_lecture(self) -> None:
        """Calls visit_lecture() for every trainee in trainees"""
        for trainee in self.trainees:
            trainee.visit_lecture()
    
    def get_passing_students(self) -> list[Trainee]:
        """Returns list of passing students"""
        passing_students = [trainee for trainee in self.trainees if trainee.is_passing()]
        return passing_students

# 1. Создаем учащихся разных типов 
std_trainee = Trainee("Алексей", "Смирнов", score=8, passing_grade=10) 
hard_trainee = HardworkingTrainee("Елена", "Петрова", score=8, passing_grade=10) 
audit_trainee = AuditTrainee("Дмитрий", "Сидоров", score=0, passing_grade=10) 
# 2. Создаем группу и добавляем студентов 
cohort = Cohort("Python Advanced") 
cohort.add_trainee(std_trainee) 
cohort.add_trainee(hard_trainee) 
cohort.add_trainee(audit_trainee) 
# 3. Проводим лекцию для всей группы (+1 балл всем) 
cohort.conduct_lecture() 
# 4. Проверяем работу переопределенного ДЗ для трудоголика (+2 балла) 
hard_trainee.do_homework() 
# 5. Выводим список тех, кто проходит курс 
passing_students = cohort.get_passing_students() 
print(f"=== УСПЕВАЕМОСТЬ ГРУППЫ '{cohort.title}' ===") 
for student in cohort.trainees: 
    print(f"{student.name} {student.surname} | Баллы: {student.score} | Проходит: {student.is_passing()}") 
print("\nУспешно зачислены на следующий модуль:") 
for student in passing_students: 
    print(f"- {student.name} {student.surname}") 
        