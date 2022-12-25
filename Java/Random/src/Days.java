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

/**
 * @author Victor-ray, S. (https://github.com/ZendaiOwl)
 *           This Enum class holds the days of the week and their number
 *           assignment from 1 to 7 starting from Monday to Sunday, however 
 *           Sunday holds the ordinal value/index of 0.
 */
enum days
{

  Sunday(7), Monday(1), Tuesday(2), Wednesday(3), Thursday(4), Friday(5), Saturday(6);

  private final int val;

  private days(int val) {
    this.val = val;
  }

  public days weekday(int day) {
    boolean notZero = false;
    if (day > 0)
      notZero = true;

    if (notZero)
      if (day == 1)
        return days.Monday;
      else
        if (day == 2)
        return days.Tuesday;
        else
          if (day == 3)
          return days.Wednesday;
          else
            if (day == 4)
            return days.Thursday;
            else
              if (day == 5)
              return days.Friday;
              else
                if (day == 6)
                return days.Saturday;
                else
                  if (day == 7)
                  return days.Sunday;
                  else
                    return null;
    else
      return null;

  }

  /**
   * @return the number of the day in the week from 1 to 7 starting with Monday
   *           Sunday is at index 0 however has the value of 7 for weekday number
   *           7
   */
  public int weekDayNr() {
    return val;

  }
}

