//
//  ViewController.swift
//  MineSweep
//
//  Created by Riley Worstell on 5/4/20.
//  Copyright © 2020 Riley Worstell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button0: UIButton!
    var boolFlag: Bool = false
    @IBAction func isFlag(_ sender: UIButton) {
        if boolFlag == true {
            boolFlag = false
        } else {
            boolFlag = true
    }
    }
    var mineArr = [[Int]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeMineArr()
        self.setBombValues()
        self.setAllValues()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func minePressed(_ sender: UIButton) {
        let mineSelected = sender as UIButton
        if boolFlag == true {
            if mineSelected.currentTitle == "F" {
                mineSelected.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
                mineSelected.setTitle("?", for: UIControl.State.normal)
            }else{
                mineSelected.setTitleColor(#colorLiteral(red: 1, green: 0.09205190092, blue: 0.09664200991, alpha: 1), for: UIControl.State.normal)
                mineSelected.setTitle("F", for: UIControl.State.normal)
                
            }
            boolFlag = false
        } else {
        
        let mineNum = mineSelected.tag
        let minex = mineNum / 8
        let miney = mineNum % 8
        
        if mineArr[minex][miney] == 9 {
            print("you lose")
            mineArr.removeAll()
            self.initializeMineArr()
            self.setBombValues()
            self.setAllValues()
            self.resetBoard()
            print("new board")
            for i in mineArr {
                       print(i)
                   }
        }
        else {
            if mineArr[minex][miney] == 0 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), for: UIControl.State.normal)
            }else if mineArr[minex][miney] == 1 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1), for: UIControl.State.normal)
            }else if mineArr[minex][miney] == 2 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControl.State.normal)
            }else if mineArr[minex][miney] == 3 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.9165322185, green: 0.3856609166, blue: 0.1505298018, alpha: 1), for: UIControl.State.normal)
            }else if mineArr[minex][miney] == 4 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControl.State.normal)
            }else if mineArr[minex][miney] == 5 {
                mineSelected.setTitleColor(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), for: UIControl.State.normal)
            }
            
            mineSelected.setTitle(String(mineArr[minex][miney]), for: UIControl.State.normal)
        }
        }
    }
    
    
    func initializeMineArr() {
        for i in 0...7{
            mineArr.append([0])
            for _ in 0...6 {
                mineArr[i].append(0)
            }
        }
        
       
        }
    func setBombValues() {
        let bomb1_x = Int.random(in: 0 ... 7)
        let bomb1_y = Int.random(in: 0 ... 7)
        let bomb2_x = Int.random(in: 0 ... 7)
        let bomb2_y = Int.random(in: 0 ... 7)
        let bomb3_x = Int.random(in: 0 ... 7)
        let bomb3_y = Int.random(in: 0 ... 7)
        let bomb4_x = Int.random(in: 0 ... 7)
        let bomb4_y = Int.random(in: 0 ... 7)
        let bomb5_x = Int.random(in: 0 ... 7)
        let bomb5_y = Int.random(in: 0 ... 7)
         mineArr[bomb1_x][bomb1_y] = 9
        mineArr[bomb2_x][bomb2_y] = 9
        mineArr[bomb3_x][bomb3_y] = 9
        mineArr[bomb4_x][bomb4_y] = 9
        mineArr[bomb5_x][bomb5_y] = 9
    }
    func resetBoard() {
      button0.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
            button0.setTitle("?", for: UIControl.State.normal)
      
        for i in 0...63 {
            if let button = self.view.viewWithTag(i) as? UIButton
            {
                button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: UIControl.State.normal)
                button.setTitle("?", for: UIControl.State.normal)
            }
        }
    }
    func setAllValues() {
        for i in 0...7 {
            for j in 0...7 {
                var setVal = 0
                
                if mineArr[i][j] == 9 {
                    
                    }
                else {
                              // FIRST BLOCK
                              if i == 0 && j == 0 {
                                  if mineArr[i+1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j+1] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END FIRST BLOCK
                              // TOP RIGHT CORNER
                              if i == 0 && j == 7 {
                                  if mineArr[i+1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j-1] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END TOP RIGHT CORNER
                              // BOTTOM RIGHT CORNER
                              if i == 7 && j == 7 {
                                  if mineArr[i-1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j-1] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END BOTTOM RIGHT CORNER
                              // BOTTOM LEFT CORNER
                                 if i == 7 && j == 0 {
                                     if mineArr[i-1][j] == 9 {
                                         setVal += 1
                                     }
                                     if mineArr[i-1][j+1] == 9 {
                                         setVal += 1
                                     }
                                     if mineArr[i][j+1] == 9 {
                                         setVal += 1
                                     }
                                 }
                                 // END BOTTOM LEFT CORNER
                              //TOP ROW
                              if i == 0 && (j != 0 && j != 7) {
                                  if mineArr[i][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j+1] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END TOP ROW
                              //Bottom ROW
                              if i == 7 && (j != 0 && j != 7) {
                                  if mineArr[i][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j+1] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END BOTTOM ROW
                              //LEFT COLUMN
                              if (i != 7 && i != 0) && j == 0{
                                  if mineArr[i-1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j+1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END LEFT COLUMN
                              //Right COLUMN
                              if (i != 7 && i != 0) && j == 7{
                                  if mineArr[i-1][j] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i-1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j-1] == 9 {
                                      setVal += 1
                                  }
                                  if mineArr[i+1][j] == 9 {
                                      setVal += 1
                                  }
                              }
                              // END Right COLUMN
                              //ALL CENTER
                             if (i != 7 && i != 0) && (j != 7 && j != 0){
                                 if mineArr[i-1][j-1] == 9 {
                                     setVal += 1
                                 }
                                 if mineArr[i-1][j] == 9 {
                                     setVal += 1
                                 }
                              if mineArr[i-1][j+1] == 9 {
                                  setVal += 1
                              }
                                 if mineArr[i][j+1] == 9 {
                                     setVal += 1
                                 }
                                 if mineArr[i+1][j+1] == 9 {
                                     setVal += 1
                                 }
                              if mineArr[i+1][j] == 9 {
                                  setVal += 1
                              }
                              if mineArr[i+1][j-1] == 9 {
                                  setVal += 1
                              }
                              if mineArr[i][j-1] == 9 {
                                  setVal += 1
                              }
                             }
                             
                             // END ALL CENTER
                              mineArr[i][j] = setVal
                } // end else
              
                 } // end for j
            } // end for i
        } // end set all balues
    }
        


