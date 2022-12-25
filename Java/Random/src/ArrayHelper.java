/*
 * Copyright 2022 Victor-ray, S. <12261439+ZendaiOwl@users.noreply.github.com>
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the Software), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * 
 * @author Victor-ray, S.
 *           This is a help class I made for array operations
 */

class ArrayHelper {
  
  /**
   * @param array
   *                to search
   * @return average value in the array
   */
  public int average(int[] array) {
    int total = 0;
    int average;
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    average = total / array.length;
    return average;
  }

  /**
   * @param array
   *                to search
   * @return average value in the array
   */
  public double average(double[] array) {
    double total = 0;
    double average;
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    average = total / array.length;
    return average;
  }

  /**
   * @param array
   *                to search
   * @return average value in the array
   */
  public double average(float[] array) {
    float total = 0;
    float average;
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    average = total / array.length;
    return average;
  }

  /**
   * @param array
   *                to search
   * @return highest value in the array
   */
  public int high(int[] array) {
    int highest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > highest)
        highest = array[index];
    return highest;
  }

  /**
   * @param array
   *                to search
   * @return lowest value in the array
   */
  public int low(int[] array) {
    int lowest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > lowest)
        lowest = array[index];
    return lowest;
  }

  /**
   * @param array
   *                to search
   * @return highest value index
   */
  public int highindex(int[] array) {
    int index = -1;
    int highest = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] > highest) {
        highest = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to search for the lowest value
   * @return lowest value in the array
   */
  public int lowindex(int[] array) {
    int index = -1;
    int low = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] < low) {
        low = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to search
   * @return largest value in the array
   */
  public double high(double[] array) {
    double highest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > highest)
        highest = array[index];
    return highest;
  }

  /**
   * @param array
   *                to search
   * @return lowest value in the array
   */
  public double low(double[] array) {
    double lowest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > lowest)
        lowest = array[index];
    return lowest;
  }

  /**
   * @param array
   *                to search
   * @return highest value index
   */
  public int highindex(double[] array) {
    int index = -1;
    double highest = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] > highest) {
        highest = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to search for the lowest value
   * @return lowest value in the array
   */
  public int lowindex(double[] array) {
    int index = -1;
    double low = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] < low) {
        low = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to search
   * @return largest float value
   */
  public float high(float[] array) {
    float highest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > highest)
        highest = array[index];
    return highest;
  }

  /**
   * @param array
   *                to search
   * @return smallest float value
   */
  public float low(float[] array) {
    float lowest = array[0];
    for (int index = 0; index < array.length; index++ )
      if (array[index] > lowest)
        lowest = array[index];
    return lowest;
  }

  /**
   * @param array
   *                to search
   * @return highest value index
   */
  public int highindex(float[] array) {
    int index = -1;
    float highest = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] > highest) {
        highest = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to search for the lowest value
   * @return lowest value in the array
   */
  public int lowindex(float[] array) {
    int index = -1;
    float low = array[0];

    for (int i = 0; i < array.length; i++ )
      if (array[i] < low) {
        low = array[i];
        index = i;
      }

    return index;
  }

  /**
   * @param array
   *                to get the total of
   * @return total integer value
   */
  public int sum(int[] array) {
    int total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    // Return the total.
    return total;
  }

  /**
   * @param 2D-array
   *                   to get the total of
   * @return total integer value
   */
  public int sum(int[][] TwoD) {
    int total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < TwoD.length; index++ )
      for (int c = 0; c < TwoD[index].length; c++ )
        total += TwoD[index][c];
    // Return the total.
    return total;
  }

  /**
   * @param 3D-array
   *                   to get the total of
   * @return total integer value
   */
  public int sum(int[][][] ThreeD) {
    int total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < ThreeD.length; index++ )
      for (int c = 0; c < ThreeD[index].length; c++ )
        for (int x = 0; x < ThreeD[index][c].length; x++ )
          total += ThreeD[index][c][x];
    // Return the total.
    return total;
  }

  /**
   * @param array
   *                to get the total of
   * @return total double value
   */
  public double sum(double[] array) {
    double total = 0.0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    // Return the total.
    return total;
  }

  /**
   * @param TwoD
   *               to get the total of
   * @return total double value
   */
  public double sum(double[][] TwoD) {
    double total = 0.0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < TwoD.length; index++ )
      for (int c = 0; c < TwoD[index].length; c++ )
        total += TwoD[index][c];
    // Return the total.
    return total;
  }

  /**
   * @param ThreeD
   *                 to get the total of
   * @return total double value
   */
  public double sum(double[][][] ThreeD) {
    double total = 0.0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the array.
    for (int index = 0; index < ThreeD.length; index++ )
      for (int c = 0; c < ThreeD[index].length; c++ )
        for (int x = 0; x < ThreeD[index][c].length; x++ )
          total += ThreeD[index][c][x];
    // Return the total.
    return total;
  }

  /**
   * @param array
   *                to get the total of
   * @return total float value
   */
  public float sum(float[] array) {
    float total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the sales array.
    for (int index = 0; index < array.length; index++ )
      total += array[index];
    // Return the total.
    return total;
  }

  /**
   * @param array
   *                to get the total of
   * @return total float value
   */
  public float sum(float[][] TwoD) {
    float total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the sales array.
    for (int index = 0; index < TwoD.length; index++ )
      for (int c = 0; c < TwoD[index].length; c++ )
        total += TwoD[index][c];
    // Return the total.
    return total;
  }

  /**
   * @param array
   *                to get the total of
   * @return total float value
   */
  public float sum(float[][][] ThreeD) {
    float total = 0;
    // Accumulator
    // Accumulate the sum of the elements
    // in the sales array.
    for (int index = 0; index < ThreeD.length; index++ )
      for (int c = 0; c < ThreeD[index].length; c++ )
        for (int x = 0; x < ThreeD[index][c].length; x++ )
          total += ThreeD[index][c][x];
    // Return the total.
    return total;
  }

  /**
   * @param array
   *                 first array to check
   * @param array2
   *                 second array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(int[] array, int[] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index < array.length) {
      if (array[index] != array2[index])
        isEqual = false;
      index++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first 2D array to check
   * @param array2
   *                 second 2D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(int[][] array, int[][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, index2 = 0, i2 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index2 < array[i2].length) {
      if (array[i2][index2] != array2[i2][index2])
        isEqual = false;
      i2++ ;
      index2++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first 3D array to check
   * @param array2
   *                 second 3D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(int[][][] array, int[][][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, index2 = 0, i2 = 0, index3 = 0, i3 = 0, ii3 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    while (isEqual
      && i2 < array[i2].length) {
      if (array[i2][index2].length != array2[i2][index2].length)
        isEqual = false;
      i2++ ;
      index2++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index3 < array[ii3][i3].length) {
      if (array[ii3][i3][index3] != array2[ii3][i3][index3])
        isEqual = false;
      ii3++ ;
      i3++ ;
      index3++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first array to check
   * @param array2
   *                 second array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(double[] array, double[] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index < array.length) {
      if (array[index] != array2[index])
        isEqual = false;
      index++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first 2D array to check
   * @param array2
   *                 second 2D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(double[][] array, double[][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, index2 = 0, i2 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index2 < array[i2].length) {
      if (array[i2][index2] != array2[i2][index2])
        isEqual = false;
      i2++ ;
      index2++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }


  /**
   * @param array
   *                 first 3D array to check
   * @param array2
   *                 second 3D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(double[][][] array, double[][][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, index2 = 0, i2 = 0, index3 = 0, i3 = 0, ii3 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    while (isEqual
      && i2 < array[i2].length) {
      if (array[i2][index2].length != array2[i2][index2].length)
        isEqual = false;
      i2++ ;
      index2++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index3 < array[ii3][i3].length) {
      if (array[ii3][i3][index3] != array2[ii3][i3][index3])
        isEqual = false;
      ii3++ ;
      i3++ ;
      index3++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }


  /**
   * @param array
   *                 first array to check
   * @param array2
   *                 second array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(float[] array, float[] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index < array.length) {
      if (array[index] != array2[index])
        isEqual = false;
      index++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first 2D array to check
   * @param array2
   *                 second 2D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(float[][] array, float[][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, index2 = 0, i2 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index2 < array[i2].length) {
      if (array[i2][index2] != array2[i2][index2])
        isEqual = false;
      i2++ ;
      index2++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                 first 3D array to check
   * @param array2
   *                 second 3D array to check
   * @return isEqual true if the arrays are equal and false otherwise
   */
  public boolean isEqual(float[][][] array, float[][][] array2) {
    boolean isEqual = true;
    // Flag variable
    int index = 0, i2 = 0, index2 = 0, ii3 = 0, i3 = 0, index3 = 0;
    // Loop control variable
    // First determine whether the arrays are the same size.
    if (array.length != array2.length)
      isEqual = false;

    while (isEqual
      && index < array.length) {
      if (array[index].length != array2[index].length)
        isEqual = false;
      index++ ;
    }

    while (isEqual
      && index2 < array[i2].length) {
      if (array[i2][index2].length != array2[i2][index2].length)
        isEqual = false;
      index2++ ;
    }

    // Next determine whether the elements contain the same data.
    while (isEqual
      && index3 < array[ii3][i3].length) {
      if (array[ii3][i3][index3] != array2[ii3][i3][index3])
        isEqual = false;
      ii3++ ;
      i3++ ;
      index3++ ;
    }

    if (isEqual)
      return isEqual;
    else
      return isEqual;
  }

  /**
   * @param array
   *                The array to be copied
   * @return Copy of the array passed to the method
   */
  public int[] copy(int[] array) {
    int[] Copy = new int[array.length];
    for (int i = 0; i < array.length; i++ )
      Copy[i] = array[i];
    return Copy;
  }

  /**
   * @param array
   *                The array to be copied
   * @return Copy of the array passed to the method
   */
  public double[] copy(double[] array) {
    double[] Copy = new double[array.length];
    for (int i = 0; i < array.length; i++ )
      Copy[i] = array[i];
    return Copy;
  }

  /**
   * @param array
   *                The array to be copied
   * @return Copy of the array passed to the method
   */
  public float[] copy(float[] array) {
    float[] Copy = new float[array.length];
    for (int i = 0; i < array.length; i++ )
      Copy[i] = array[i];
    return Copy;
  }

  /**
   * Searches through an array in sequence for the specified value and returns the
   * index of the element
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index of the element with the value
   */
  public int searchSequential(int[] array, int value) {
    int index;
    // Loop control variable
    int element;
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index = 0;
    // Store the default values element and found.
    element = -1;
    found = false;

    // Search the array.
    while ( !found
      && index < array.length) {

      if (array[index] == value) {
        found = true;
        element = index;
      }

      index++ ;
    }

    return element;
  }

  /**
   * Searches through a 2D array in sequence for the specified value and returns
   * the index of the element in the inner and outer array as an integer array.
   * The first value of the returned array is the index of the inner array and
   * the second value in the array is the index of the outer array.
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index's of the element with the value in an integer array
   */
  public int[] searchSequential(int[][] array, int value) {
    int index1, index2;
    // Loop control variable
    int[] theindex = new int[2];
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index1 = 0;
    index2 = 0;
    // Store the default values element and found.
    theindex[0] = -1;
    theindex[1] = -1;
    found = false;

    // Search the array.
    while ( !found
      && index1 < array.length) {

      if (array[index1][index2] == value) {
        found = true;
        theindex[0] = index1;
        theindex[1] = index2;
      }

      index1++ ;
      index2++ ;
    }

    return theindex;
  }

  /**
   * Searches through an array in sequence for the specified value and returns the
   * index of the element
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index of the element with the value
   */
  public int searchSequential(double[] array, double value) {
    int index;
    // Loop control variable
    int element;
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index = 0;
    // Store the default values element and found.
    element = -1;
    found = false;

    // Search the array.
    while ( !found
      && index < array.length) {

      if (array[index] == value) {
        found = true;
        element = index;
      }

      index++ ;
    }

    return element;
  }

  /**
   * Searches through a 2D array in sequence for the specified value and returns
   * the index of the element in the inner and outer array as an integer array.
   * The first value of the returned array is the index of the inner array and
   * the second value in the array is the index of the outer array.
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index's of the element with the value in an integer array
   */
  public int[] searchSequential(double[][] array, double value) {
    int index1, index2;
    // Loop control variable
    int[] theindex = new int[2];
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index1 = 0;
    index2 = 0;
    // Store the default values element and found.
    theindex[0] = -1;
    theindex[1] = -1;
    found = false;

    // Search the array.
    while ( !found
      && index1 < array.length) {

      if (array[index1][index2] == value) {
        found = true;
        theindex[0] = index1;
        theindex[1] = index2;
      }

      index1++ ;
      index2++ ;
    }

    return theindex;
  }

  /**
   * Searches through an array in sequence for the specified value and returns the
   * index of the element
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index of the element with the value
   */
  public int searchSequential(float[] array, float value) {
    int index;
    // Loop control variable
    int element;
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index = 0;
    // Store the default values element and found.
    element = -1;
    found = false;

    // Search the array.
    while ( !found
      && index < array.length) {

      if (array[index] == value) {
        found = true;
        element = index;
      }

      index++ ;
    }

    return element;
  }

  /**
   * Searches through a 2D array in sequence for the specified value and returns
   * the index of the element in the inner and outer array as an integer array.
   * The first value of the returned array is the index of the inner array and
   * the second value in the array is the index of the outer array.
   * 
   * @param array
   *                to search
   * @param value
   *                to find in the array
   * @return the index's of the element with the value in an integer array
   */
  public int[] searchSequential(float[][] array, float value) {
    int index1, index2;
    // Loop control variable
    int[] theindex = new int[2];
    // Element the value is found at
    boolean found;
    // Flag indicating search results
    // Element 0 is the starting point of the search.
    index1 = 0;
    index2 = 0;
    // Store the default values element and found.
    theindex[0] = -1;
    theindex[1] = -1;
    found = false;

    // Search the array.
    while ( !found
      && index1 < array.length) {

      if (array[index1][index2] == value) {
        found = true;
        theindex[0] = index1;
        theindex[1] = index2;
      }

      index1++ ;
      index2++ ;
    }

    return theindex;
  }

  /**
   * This method uses the Binary Search Algorithm to search for a value in an
   * array
   * 
   * @param array
   *                to search for a value
   * @param value
   *                the value to search for in the array
   * @return the index of the value in the array
   */
  public int searchBinary(int[] array, int value) {
    int first;
    // First array element
    int last;
    // Last array element
    int middle;
    // Midpoint of search
    int position;
    // Position of search value
    boolean found; // Flag
    // Set the inital values.
    first = 0;
    last = array.length - 1;
    position = -1;
    found = false;

    // Search for the value.
    while ( !found
      && first <= last) {// Calculate midpoint
      middle = (first + last) / 2;

      // If value is found at midpoint...
      if (array[middle] == value) {
        found = true;
        position = middle;
      }
      // else if value is in lower half...
      else
        if (array[middle] > value)
        last = middle - 1;
        // else if value is in upper half....
        else
          first = middle + 1;

    }

    // Return the position of the item, or -1
    // if it was not found.
    return position;
  }

  /**
   * This method uses the Binary Search Algorithm to search for a value in an
   * array
   * 
   * @param array
   *                to search for a value
   * @param value
   *                the value to search for in the array
   * @return the index of the value in the array
   */
  public int searchBinary(double[] array, double value) {
    int first;
    // First array element
    int last;
    // Last array element
    int middle;
    // Midpoint of search
    int position;
    // Position of search value
    boolean found; // Flag
    // Set the inital values.
    first = 0;
    last = array.length - 1;
    position = -1;
    found = false;

    // Search for the value.
    while ( !found
      && first <= last) {// Calculate midpoint
      middle = (first + last) / 2;

      // If value is found at midpoint...
      if (array[middle] == value) {
        found = true;
        position = middle;
      }
      // else if value is in lower half...
      else
        if (array[middle] > value)
        last = middle - 1;
        // else if value is in upper half....
        else
          first = middle + 1;

    }

    // Return the position of the item, or -1
    // if it was not found.
    return position;
  }

  /**
   * This method uses the Binary Search Algorithm to search for a value in an
   * array
   * 
   * @param array
   *                to search for a value
   * @param value
   *                the value to search for in the array
   * @return the index of the value in the array
   */
  public int searchBinary(float[] array, float value) {
    int first;
    // First array element
    int last;
    // Last array element
    int middle;
    // Midpoint of search
    int position;
    // Position of search value
    boolean found; // Flag
    // Set the inital values.
    first = 0;
    last = array.length - 1;
    position = -1;
    found = false;

    // Search for the value.
    while ( !found
      && first <= last) {// Calculate midpoint
      middle = (first + last) / 2;

      // If value is found at midpoint...
      if (array[middle] == value) {
        found = true;
        position = middle;
      }
      // else if value is in lower half...
      else
        if (array[middle] > value)
        last = middle - 1;
        // else if value is in upper half....
        else
          first = middle + 1;

    }

    // Return the position of the item, or -1
    // if it was not found.
    return position;
  }

  /**
   * This method uses the selection sort algorithm to sort an array
   * 
   * @param array
   *                to sort
   */
  public void sort(int[] array) {
    int startScan, index, minIndex, minValue;

    for (startScan = 0; startScan < (array.length - 1); startScan++ ) {
      minIndex = startScan;
      minValue = array[startScan];

      for (index = startScan + 1; index < array.length; index++ ) {

        if (array[index] < minValue) {
          minValue = array[index];
          minIndex = index;
        }

      }

      array[minIndex] = array[startScan];
      array[startScan] = minValue;
    }

  }

  /**
   * This method uses the selection sort algorithm to sort an array
   * 
   * @param array
   *                to sort
   */
  public void sort(double[] array) {
    int startScan, index, minIndex;
    double minValue;

    for (startScan = 0; startScan < (array.length - 1); startScan++ ) {
      minIndex = startScan;
      minValue = array[startScan];

      for (index = startScan + 1; index < array.length; index++ ) {

        if (array[index] < minValue) {
          minValue = array[index];
          minIndex = index;
        }

      }

      array[minIndex] = array[startScan];
      array[startScan] = minValue;
    }

  }

  /**
   * This method uses the selection sort algorithm to sort an array
   * 
   * @param array
   *                to sort
   */
  public void sort(float[] array) {
    int startScan, index, minIndex;
    float minValue;

    for (startScan = 0; startScan < (array.length - 1); startScan++ ) {
      minIndex = startScan;
      minValue = array[startScan];

      for (index = startScan + 1; index < array.length; index++ ) {

        if (array[index] < minValue) {
          minValue = array[index];
          minIndex = index;
        }

      }

      array[minIndex] = array[startScan];
      array[startScan] = minValue;
    }

  }

  /**
   * @param array
   *                 of Strings to search for a match
   * @param lookup
   *                 String to search for in the String array
   * @return a String array of all the matches
   */
  public String[] searchPartialString(String[] array, String lookup) {
    String[] match = new String[array.length];

    for (int i = 0; i < array.length; i++ )
      for (String str : array)
        if (str.startsWith(lookup))
          match[i] = str;
    return match;
  }

}
