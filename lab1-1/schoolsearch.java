import java.util.*;
import java.io.File;
import java.io.FileNotFoundException;

class Student {
   String stLastName, stFirstName, tLastName, tFirstName;
   int grade, classroom, bus;
   double gpa;

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

   public static void info(ArrayList<Student> studentList) {
      int[] classSizes = getCLassSizes(studentList);
      printInfo(classSizes);
   }

   public static int[] getCLassSizes(ArrayList<Student> studentList) {
      int[] classSizes = new int[6];
      for (Student student: studentList) {
         switch (student.grade) {
            case 1: classSizes[0]++;
                  break;
            case 2: classSizes[1]++;
                  break;
            case 3: classSizes[2]++;
                  break;
            case 4: classSizes[3]++;
                  break;
            case 5: classSizes[4]++;
                  break;
            case 6: classSizes[5]++;
                  break;
         }
      }
      return classSizes;
   }

   public static void printInfo(int[] classSizes) {
      System.out.println("Gr     Count");
      System.out.println("1   :  " + classSizes[0]);
      System.out.println("2   :  " + classSizes[1]);
      System.out.println("3   :  " + classSizes[2]);
      System.out.println("4   :  " + classSizes[3]);
      System.out.println("5   :  " + classSizes[4]);
      System.out.println("6   :  " + classSizes[5]);
   }
}

public class schoolsearch {

public static void main(String[] args){

   File file = new File("students.txt");
   ArrayList<Student> studentList = new ArrayList<Student>();
   Scanner scanner;
   try {
      scanner = new Scanner(file);
   } catch (Exception e) {
      return;
   }

   scanner.useDelimiter(",|\\n");
   String stLastName, stFirstName, tLastName, tFirstName;
   int grade, classroom, bus;
   double gpa;


   while(scanner.hasNext()) {
      try {
         Student student = new Student(scanner.next().toLowerCase(), scanner.next().toLowerCase(), Integer.parseInt(scanner.next()), Integer.parseInt(scanner.next()), Integer.parseInt(scanner.next()), Double.parseDouble(scanner.next()), scanner.next().toLowerCase(), scanner.next().toLowerCase());
         studentList.add(student);
      } catch (Exception e){
         System.out.println("Bad Input... Exiting");
         return;
      }
   }

   System.out.println("Hi welcome to the school search program!");
   System.out.println("Select one:");
   System.out.println("S[tudent]: <lastname> [B[us]]");
   System.out.println("T[eacher]: <lastname>");
   System.out.println("B[us]: <number>");
   System.out.println("G[rade]: <number>");
   System.out.println("A[verage]: <number>");
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
         case "t:": Student.teacherSearch(studentList, strArr[1]);
                  break;
         case "b:": Student.busSearch(studentList, Integer.parseInt(strArr[1]));
                  break;
         case "i": Student.info(studentList);
                  break;
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
