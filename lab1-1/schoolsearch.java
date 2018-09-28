import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;

class Student {
   String stLastName, stFirstName, tLastName, tFirstName;
   int grade, classroom, bus;
   double gpa;

   public Student(String stLastName, String stFirstName, int grade, int classroom, int bus, double gpa){
      this.stLastName = stLastName;
      this.stFirstName = stFirstName;
      this.grade = grade;
      this.classroom = classroom;
      this.bus = bus;
      this.gpa = gpa;
   }

   public Student(String stLastName, String stFirstName, int grade, int classroom, int bus, double gpa, String tLastName, String tFirstName){
      this.stLastName = stLastName;
      this.stFirstName = stFirstName;
      this.grade = grade;
      this.classroom = classroom;
      this.bus = bus;
      this.gpa = gpa;
      this.tLastName = tLastName;
      this.tFirstName = tFirstName;
   }

   // Traceability: implements requirements R4
   // displays name, grade, classroom, and teacher name for students with given lastname
   // S: <lastname>
   public static void studentSearch(ArrayList<Student> studentList, String stLastName) {
      int count = 1;
      for(Student student: studentList) {
         if(student.stLastName.equals(stLastName)){
            System.out.println("Student " + count++);
            System.out.print("    Name: " + student.stFirstName + " " +
               student.stLastName);
            System.out.println("      Grade: " + student.grade);
            System.out.print("    Classroom: " + student.classroom);
            System.out.println("      Teacher's Name: " + student.tFirstName +
               " " + student.tLastName);
         }
      }
   }

   // Traceability: implements requirements R5
   // search for students with the given last name and provide bus route
   // S: <lastname> B[us]
   public static void studentSearchBus(ArrayList<Student> studentList, String stLastName) {
      int count = 1;
      for(Student student: studentList) {
         if(student.stLastName.equals(stLastName)){
            System.out.println("Student " + count++);
            System.out.println("    Name: " + student.stFirstName + " " +
               student.stLastName);
            System.out.println("    Bus Route: " + student.bus);
         }
      }
   }

   // Traceability: implements requirements R6
   // searches and prints the names of the students with given teacher
   // T: <lastname>
   public static void teacherSearch(ArrayList<Student> studentList, String teacherName) {
      int count = 1;
      for (Student student: studentList) {
         if (student.tLastName.equals(teacherName)) {
            System.out.println("Student " + count++);
            System.out.println("    Name: " + student.stFirstName + " " +
               student.stLastName);
         }
      }
   }

   // Traceability: implements requirements R7
   // finds and prints all of the students for a given grade
   // G: <number>
   public static void gradeSearch(ArrayList<Student> studentList, int grade) {
      int inst = 1;
      for(Student student: studentList) {
         if(student.grade == grade){
            System.out.println("Instance " + inst++ + ":");
            System.out.println("Last Name: " + student.stLastName);
            System.out.println("First Name: " + student.stFirstName);
         }
      }
   }

   // Traceability: implements requirements R8
   // displays student's name, grade, and classroom for a given bus route
   // B: <number>
   public static void busSearch(ArrayList<Student> studentList, int busRoute) {
      int count = 1;
      for (Student student: studentList) {
         if (student.bus == busRoute) {
            System.out.println("Student " + count++);
            System.out.println("    Last Name: " + student.stLastName);
            System.out.println("    First Name: " + student.stFirstName);
            System.out.println("    Grade: " + student.grade);
            System.out.println("    Classroom " + student.classroom);
         }
      }
   }

   // Traceability: implements requirements R9
   // Given a grade and the H command, display the name, gpa, teacher, and bus route of the student with highest gpa
   // G: <number> H
   public static void gradeSearchHigh(ArrayList<Student> studentList, int grade) {
      Student bestStudent = new Student("dummy", "dummy", 0, 0, 0, -1.0, "dummy", "dummy");
      for(Student student: studentList) {
         if(student.grade == grade && student.gpa > bestStudent.gpa){
            bestStudent = student;
         }
      }
      System.out.println("Student with Highest GPA:");
      System.out.println("Last Name: " + bestStudent.stLastName);
      System.out.println("First Name: " + bestStudent.stFirstName);
      System.out.println("GPA: " + bestStudent.gpa);
      System.out.println("Teacher's Last Name: " + bestStudent.tLastName);
      System.out.println("Teacher's First Name: " + bestStudent.tFirstName);
      System.out.println("Bus Route: " + bestStudent.bus);
   }

   // Traceability: implements requirements R9
   // Given a grade and the L command, display the name, gpa, teacher, and bus route of the student with the lowest gpa
   // G: <number> L
   public static void gradeSearchLow(ArrayList<Student> studentList, int grade) {
      Student worstStudent = new Student("dummy", "dummy", 0, 0, 0, 10.0, "dummy", "dummy");
      for(Student student: studentList) {
         if(student.grade == grade && student.gpa < worstStudent.gpa){
            worstStudent = student;
         }
      }
      System.out.println("Student with Lowest GPA:");
      System.out.println("Last Name: " + worstStudent.stLastName);
      System.out.println("First Name: " + worstStudent.stFirstName);
      System.out.println("GPA: " + worstStudent.gpa);
      System.out.println("Teacher's Last Name: " + worstStudent.tLastName);
      System.out.println("Teacher's First Name: " + worstStudent.tFirstName);
      System.out.println("Bus Route: " + worstStudent.bus);
   }

   // Traceability: implements requirements R10
   // compute the average student GPA for a given grade
   // A: <number>
   public static void getAverageGPA(ArrayList<Student> studentList, int grade) {
      double total = 0;
      int numStudents = 0;
      for(Student student: studentList) {
         if(student.grade == grade){
            total += student.gpa;
            numStudents++;
         }
      }
      System.out.println("Average GPA in Grade " + grade + ": " + total/numStudents);
   }

   // Traceability: implements requirements R11
   // For each grade (0-6), compute the total number of students in it, displayed in ascending order
   // I
   public static void info(ArrayList<Student> studentList) {
      int[] classSizes = getCLassSizes(studentList);
      printInfo(classSizes);
   }

   public static int[] getCLassSizes(ArrayList<Student> studentList) {
      int[] classSizes = new int[7];
      for (Student student: studentList) {
         switch (student.grade) {
            case 0: classSizes[0]++;
                  break;
            case 1: classSizes[1]++;
                  break;
            case 2: classSizes[2]++;
                  break;
            case 3: classSizes[3]++;
                  break;
            case 4: classSizes[4]++;
                  break;
            case 5: classSizes[5]++;
                  break;
            case 6: classSizes[6]++;
                  break;
         }
      }
      return classSizes;
   }

   public static void printInfo(int[] classSizes) {
      System.out.println("Gr     Count");
      for (int i = 0; i < 7; i++)
         System.out.println(i + "   :  " + classSizes[i]);
   }

   // Analysis


   // Traceability: implements requirements NR5
   // display all student gpas for a given teacher's last name
   // T: <lastname> A
   public static void teacherSearchAnalysis(ArrayList<Student> studentList, String teacherName) {
      int count = 1;
      for (Student student: studentList) {
         if (student.tLastName.equals(teacherName)) {
            System.out.println("GPA " + count++ + ": " + student.gpa);
         }
      }
   }

   // Traceability: implements requirements NR5
   // display all student gpas for a given grade
   // G: <number> A
   public static void gradeSearchAnalysis(ArrayList<Student> studentList, int grade) {
      int count = 1;
      for(Student student: studentList) {
         if(student.grade == grade){
            System.out.println("GPA " + count++ + ": " + student.gpa);
         }
      }
   }

   // Traceability: implements requirements NR5
   // display all student gpas for a given bus route
   // B: <number> A
   public static void busSearchAnalysis(ArrayList<Student> studentList, int busRoute) {
      int count = 1;
      for (Student student: studentList) {
         if (student.bus == busRoute) {
            System.out.println("GPA " + count++ + ": " + student.gpa);
         }
      }
   }

   // Extended Search

   // Traceability: implements requirements NR1
   // given a classroom number, list all students assigned to it
   // C: <classroom> S
   public static void classSearchStudent(ArrayList<Student> studentList, int classNum) {
      int count = 1;
      for (Student student : studentList) {
         if (student.classroom == classNum) {
            System.out.println("Student " + count++);
            System.out.println("      Name: " + student.stFirstName + " " + student.stLastName);
         }
      }
   }

   // Traceability: implements requirements NR2
   // given a classroom number, find the teacher (or teachres) teaching in it
   // C: <classroom> T
   public static void classSearchTeacher(ArrayList<Teacher> teacherList, int classNum) {
      int count = 1;
      for (Teacher teacher : teacherList) {
         if (teacher.classroom == classNum) {
            System.out.println("Teacher " + count++);
            System.out.println("      Name: " + teacher.tFirstName + " " + teacher.tLastName);
         }
      }
   }

   // Traceability: implements requirements NR3
   // given a grade, find all teachers who teach it
   // G: <number> T
   public static void searchGradeTeachers(ArrayList<Student> studentList, int grade) {
      int count = 0;
      ArrayList<String> tList = new ArrayList<String>();
      for (Student student : studentList) {
         if (student.grade == grade && !(tList.contains(student.tFirstName + " " + student.tLastName))) {
            tList.add(count++, student.tFirstName + " " + student.tLastName);
         }
      }
      System.out.println("Teachers for grade " + grade + ":");
      for (String s : tList)
         System.out.println("    " + s);

   }

   // Traceability: implements requirements NR4
   // computes the total number of students in each of the classrooms
   // E
   public static void classroomEnrollment(ArrayList<Student> studentList, ArrayList<Teacher> teacherList) {
      ArrayList<ClassSize> classrooms = new ArrayList<ClassSize>();
      for (Teacher teacher : teacherList)
         classrooms.add(new ClassSize(teacher.classroom));
      for (Student student : studentList) {
         incrementCount(classrooms, student.classroom);
      }
      System.out.println("Classroom      Students");
      for (ClassSize room : classrooms)
         System.out.println(room);
   }

   private static void incrementCount(ArrayList<ClassSize> classSizes, int roomNum) {
      for (ClassSize room : classSizes) {
         if (room.equals(roomNum))
            room.incr();
      }
   }
}

class ClassSize {
   int classroom, count;

   public ClassSize(int roomNum) {
      this.classroom = roomNum;
      this.count = 0;
   }

   public void incr() {
      ++this.count;
   }

   public String toString() {
      return String.format("%3s               ",this.classroom) + this.count;
   }

   public boolean equals(int n) {
      if (this.classroom == n)
         return true;
      else
         return false;
   }
}

class Teacher {
   String tLastName, tFirstName;
   int classroom;

   public Teacher(String tLastName, String tFirstName, int classroom) {
      this.tLastName = tLastName;
      this.tFirstName = tFirstName;
      this.classroom = classroom;
   }
}

public class schoolsearch {

public static void main(String[] args){

   File fileStudents = new File("list.txt");
   File fileTeachers = new File("teachers.txt");
   ArrayList<Student> studentList = new ArrayList<Student>();
   ArrayList<Teacher> teacherList = new ArrayList<Teacher>();
   Scanner scannerStudents, scannerTeachers, scanner;
   try {
      scannerStudents = new Scanner(fileStudents);
      scannerTeachers = new Scanner(fileTeachers);
   } catch (Exception e) {
      return;
   }

   scannerStudents.useDelimiter(",\\s|,|\\n");
   scannerTeachers.useDelimiter(",\\s|,|\\n");


   while(scannerStudents.hasNext()) {
      try {
         Student student = new Student(scannerStudents.next().toLowerCase(), scannerStudents.next().toLowerCase(), Integer.parseInt(scannerStudents.next()), Integer.parseInt(scannerStudents.next()), Integer.parseInt(scannerStudents.next()), Double.parseDouble(scannerStudents.next()));
         studentList.add(student);
      } catch (Exception e){
         System.out.println("Bad Student Input... Exiting");
         return;
      }
   }

   while(scannerTeachers.hasNext()) {
      try {
         Teacher teacher = new Teacher(scannerTeachers.next().toLowerCase(), scannerTeachers.next().toLowerCase(), Integer.parseInt(scannerTeachers.next()));
         teacherList.add(teacher);
      } catch (Exception e){
         System.out.println("Bad Teacher Input... Exiting");
         return;
      }
   }

   for(Teacher teacher: teacherList){
      for(Student student: studentList){
         if(teacher.classroom == student.classroom){
            student.tLastName = teacher.tLastName;
            student.tFirstName = teacher.tFirstName;
         }
      }
   }



   System.out.println("Hi welcome to the school search program!");
   System.out.println("Select one:");
   System.out.println("S[tudent]: <lastname> [B[us]]");
   System.out.println("T[eacher]: <lastname> [A[nalytics]]");
   System.out.println("B[us]: <number>  [A[nalytics]]");
   System.out.println("G[rade]: <number> [A[nalytics]|T[eachers]|[H[igh]]|[L[ow]]]");
   System.out.println("A[verage]: <number>");
   System.out.println("C[lassroom]: <number> S[tudents]|T[eachers]");
   System.out.println("E[nrollment]");
   System.out.println("I[nfo]");
   System.out.println("Q[uit]");
   System.out.println();

   scanner = new Scanner(System.in);
   String input = scanner.nextLine().toLowerCase();
   while(!input.equals("q")) {
      String[] strArr = input.split("\\s+");
      switch (strArr[0]) {
         case "s:": if(strArr.length == 2){
                     Student.studentSearch(studentList, strArr[1]);
                  } else if(strArr.length == 3 && strArr[2].equals("b")) {
                     Student.studentSearchBus(studentList, strArr[1]);
                  } else {
                     System.out.println("Invalid Option... Try again");
                  }
                  break;
         case "g:": if(strArr.length == 2){
                     try {
                        Student.gradeSearch(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                  } else if(strArr.length == 3 && strArr[2].equals("h")) {
                     try {
                        Student.gradeSearchHigh(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                  } else if(strArr.length == 3 && strArr[2].equals("l")) {
                     try {
                        Student.gradeSearchLow(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                  } else if(strArr.length == 3 && strArr[2].equals("a")) {
                     try {
                        Student.gradeSearchAnalysis(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                  } else if(strArr.length == 3 && strArr[2].equals("t")) {
                     try {
                        Student.searchGradeTeachers(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                  } else {
                     System.out.println("Invalid Option... Try again");
                  }
                  break;
         case "a:": try {
                        Student.getAverageGPA(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Grade... Try again");
                        break;
                     }
                     break;
         case "t:": if(strArr.length == 2){
                     try {
                        Student.teacherSearch(studentList, strArr[1]);
                     } catch (Exception e) {
                        System.out.println("Entered Not a Name for Teacher... Try again");
                        break;
                     }
                  } else if(strArr.length == 3  && strArr[2].equals("a")){
                     try {
                        Student.teacherSearchAnalysis(studentList, strArr[1]);
                     } catch (Exception e) {
                        System.out.println("Entered Not a Name for Teacher... Try again");
                        break;
                     }
                  }
                  break;
         case "b:": if(strArr.length == 2){
                     try {
                        Student.busSearch(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Bus Route... Try again");
                        break;
                     }
                  } else if(strArr.length == 3 && strArr[2].equals("a")){
                     try {
                        Student.busSearchAnalysis(studentList, Integer.parseInt(strArr[1]));
                     } catch (Exception e) {
                        System.out.println("Entered Not a Number for Bus Route... Try again");
                        break;
                     }
                  }
                  break;
         case "i": Student.info(studentList);
                  break;
         case "e": Student.classroomEnrollment(studentList, teacherList);
                  break;
         case "c:": if (strArr.length == 3) {
                        if (strArr[2].equals("s")) {
                           try {
                              Student.classSearchStudent(studentList, Integer.parseInt(strArr[1]));
                              break;
                           } catch (Exception e) {
                              System.out.println("Entered Not a Number for Classroom... Try again");
                              break;
                           }
                        }
                        else if (strArr[2].equals("t")) {
                           try {
                              Student.classSearchTeacher(teacherList, Integer.parseInt(strArr[1]));
                              break;
                           } catch (Exception e) {
                              System.out.println("Entered Not a Number for Classroom... Try again");
                              break;
                           }
                        }
                     }
         default: System.out.println("Invalid Option... Try again");
                  break;
      }
      System.out.println();
      System.out.print("Enter New Selection: ");
      input = scanner.nextLine().toLowerCase();
      System.out.println();
   }



   }
}
