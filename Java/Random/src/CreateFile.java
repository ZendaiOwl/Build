/**
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
 */

import java.io.FileNotFoundException;
import java.io.PrintWriter;

/**
 * @author Victor-ray, S.
 *
 */
public class CreateFile {

  private PrintWriter filewrite;

  /**
   * @return true if it was and false if not
   */
  public boolean createAFile(String filename) {
    try {
      createFile(filename);
      this.filewrite.close();
      return true;
    } catch (Exception e) {
      this.filewrite.close();
      e.printStackTrace();
      return false;
    }
  }

  /**
   * @param filename
   *                   creates a file with this name in the same directory as the
   *                   java project and class
   */
  public boolean createFile(String filename) {
    try {
      this.filewrite = new PrintWriter(filename);
      filewrite.close();
      return true;
    } catch (FileNotFoundException e) {
      // If there was an issue creating the file
      filewrite.close();
      e.printStackTrace();
      return false;
    }
  }

  /**
   * @param filename of the file to create and write to
   * @param lines in a String array that will be written to the file
   * @return true if it was created and data was written, false if not
   */
  public void createAndWriteFile(String filename, String[] lines) {
    try {
      this.filewrite = new PrintWriter(filename);
      for (String str : lines)
        filewrite.write(str);
      filewrite.close();
    } catch (FileNotFoundException e) {
      // If there was an issue creating the file
      filewrite.close();
      e.printStackTrace();
    }
  }
}
