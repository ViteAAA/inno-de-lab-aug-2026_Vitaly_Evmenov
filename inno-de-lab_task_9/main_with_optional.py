class Trainee:

    def __init__(self, name: str, surname: str, score: int = 0, passing_grade: int = 10):
        self.name: str = name
        self.surname: str = surname
        self.passing_grade: int = passing_grade
        self.score = score

    @property
    def score(self) -> int:
        return self.__score

    @score.setter
    def score(self, new_score: int) -> None:
        if type(new_score) is not int:
            raise ValueError(f"Expected value of type int, got {type(new_score)}")
        elif new_score < 0:
            raise ValueError("The score shouldn't be less than 0!")

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
        """Returns always True"""
        return True

class Cohort:

    def __init__(self, title: str, trainees: list[Trainee] | None = None):
        self.title: str = title
        self.trainees: list[Trainee] = list(trainees if trainees is not None else [])

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

    
# TASK 1 - DEMO MAIN
print("=== ПРОВЕРКА УСПЕВАЕМОСТИ СТАЖЕРА ===")

# 1. Создание стажера с начальным баллом 9 и проходным баллом 10 
trainee = Trainee(name="Иван", surname="Иванов", score=9, passing_grade=10) 
# 2. Выполнение домашнего задания и проверка статуса 
trainee.do_homework() 
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}") 
# 3. Пропуск лекции и проверка статуса 
trainee.miss_lecture() 
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}") 
# 4. Проверка валидации (попытка задать неверный тип или отрицательное значение) 
try: 
    trainee.score = -5 
except ValueError as e: 
    print(f"Ошибка: {e}") 
print("=====================================\n\n")



# TASK 2 - DEMO OPTIONAL
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