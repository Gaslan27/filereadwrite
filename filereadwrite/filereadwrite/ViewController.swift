//
//  ViewController.swift
//  filereadwrite
//
//  Created by Emre Erol on 28.01.2019.
//  Copyright © 2019 Codework. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var fileManager = FileManager()
    var tmpDir = NSTemporaryDirectory()
    let file = "dosya.txt"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func createFile(_ sender: Any) {
        let metin = "Dosyaya yazılacak olan metin."
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent(file)
            do {
                try metin.write(to: dosyaYolu, atomically: false, encoding: .utf8)
            }
            catch {
                print("Hata meydana geldi.")
            }
        }
    }
    
    @IBAction func listDirectory(_ sender: Any) {
        enumerateDirectory()
    }
    
    @IBAction func showFileContent(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent(file)
            do {
                let text2 = try String(contentsOf: dosyaYolu, encoding: .utf8)
                print(text2)
            }
            catch {
                print("Hata meydana geldi.")
            }
        }
    }
    
    @IBAction func deleteFile(_ sender: Any) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let dosyaYolu = dir.appendingPathComponent(file)
            do {
                try fileManager.removeItem(at: dosyaYolu)
                print("Dosya Silindi!")
            }
            catch{
                print("Hata meydana geldi")
            }
        }
    }
    
    func enumerateDirectory() {
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        do {
            let fileURLs = try fileManager.contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil)
            print(fileURLs)
        } catch {
            print("Error while enumerating files \(documentsURL.path): \(error.localizedDescription)")
        }
    }
}

