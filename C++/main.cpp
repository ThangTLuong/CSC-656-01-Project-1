//
// template C++ code for doing bubblesort, W. Bethel, SFSU, 2/2023
//
// Name: Thang Luong
// Course: CSC 656-01, Project #1
// Date: 2/6/2023
// Description: A bubble sort to sort an array of size 10 with all of the numbers in the array being randomly generated.
//

#include <iostream>
#include <unistd.h>
#include <random>

#define     ARRAYSIZE         10
#define     MIN               1
#define     MAX               9

using namespace std;


// Generates a random number.
// A pseudo random number generator.
int generateRandomNumber (int min, int max) {
   random_device randomDevice;
   uniform_int_distribution<int> dist(min, max);
  
  return dist(randomDevice);
}

// Overload the << operator to print out all the element in the array instead
// of printing out its address.
ostream& operator<< (ostream& os, const int (&array)[ARRAYSIZE]) {
   for (int num: array)
      os << num << " ";
   os << "\n";

   return os;
}

int main (int argc, char **argv) {
   // int a[] = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1}; // replace with your own random 10 ints from www.calculator.net/random-number-generator.html
   int array[ARRAYSIZE];

   for (int i = 0; i < ARRAYSIZE; i++) 
      array[i] = generateRandomNumber(MIN, MAX);

   // print out the contents of a before the sort
   // insert your code here

   cout << " a before sort " << "\n" << array;
   cout << "\n";

   // do the sort into ascending order. 
   // insert your code here

   for (int i = 0; i < ARRAYSIZE; i++)
      for (int j = 0; j < ARRAYSIZE - i - 1; j++)
         if (array[j] > array[j+1]) 
            swap(array[j], array[j+1]);

   // print out the contents of a after the sort
   // insert your code here

   cout <<" a after sort " << "\n" << array;
}
// EOF
