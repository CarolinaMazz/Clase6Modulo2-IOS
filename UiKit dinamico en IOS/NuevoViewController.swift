//
//  NuevoViewController.swift
//  UiKit dinamico en IOS
//
//  Created by Alumno on 14/03/17.
//  Copyright © 2017 JorgeLimo. All rights reserved.
//

import UIKit

class NuevoViewController: UIViewController {
    
    var vwCabecera:UIView!
    var lbTitulo:UILabel!
    var segControler:UISegmentedControl!
    var btnAceptar:UIButton!
    var btnCancelar:UIButton!
    var colorApp:UIColor!
    var arregloVistas = Array<UIView>()
    let margen:CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorApp = UIColor(red: 102/255.0, green: 204/255.0, blue: 1, alpha: 1.0)
        //margen = CGFloat(10)

        // Do any additional setup after loading the view.
        
        
        vwCabecera=UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60))
        vwCabecera.backgroundColor = colorApp
        self.view.addSubview(vwCabecera)
        
        //lbTitulo=UILabel(frame: CGRect(x: vwCabecera.frame.origin.x, y: vwCabecera.frame.origin.y, width: vwCabecera.frame.size.width, height: vwCabecera.frame.size.height))
        
        lbTitulo = UILabel(frame: vwCabecera.frame)
        lbTitulo.text="UIKIT Dinamico en IOS"
        lbTitulo.textColor = UIColor.white
        lbTitulo.font = UIFont(name: "Helvetica", size: 17)
        lbTitulo.textAlignment = NSTextAlignment.center
        vwCabecera.addSubview(lbTitulo)
        
        segControler = UISegmentedControl(frame: CGRect(x: margen, y: vwCabecera.frame.size.height + margen, width: self.view.frame.size.width - 20, height: 30))
        segControler.insertSegment(withTitle: "Primero", at: 0, animated: true)
        segControler.insertSegment(withTitle: "Segundo", at: 1, animated: true)
        segControler.tintColor = colorApp
        segControler.selectedSegmentIndex = 0
        self.view.addSubview(segControler)
        
        btnAceptar = UIButton(frame: CGRect(x: margen, y: self.view.frame.size.height - 30 - margen, width: 120, height: 30))
        btnAceptar.setTitle("Aceptar", for: UIControlState.normal)
        btnAceptar.backgroundColor = colorApp
        //agregamos una accion al boton con un selector y creando la funcion que ejecutara el evento
        btnAceptar.addTarget(self, action: #selector(aceptar), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btnAceptar)
        
        btnCancelar = UIButton(frame: CGRect(x: self.view.frame.size.width - 120 - margen, y: btnAceptar.frame.origin.y , width: 120, height: 30))
        btnCancelar.setTitle("Cancelar", for: UIControlState.normal)
        btnCancelar.setTitleColor(colorApp, for: UIControlState.normal)
        btnCancelar.addTarget(self, action: #selector(cancelar), for: UIControlEvents.touchDown)
        self.view.addSubview(btnCancelar)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func aceptar(sender:UIButton){
        
        
        if (arregloVistas.count==0){
            print("Aceptar")
            for i in 0...7 {
                let vista = UIView(frame: CGRect(x: 100 + (i * 10), y: 100 + (i * 10), width: 100, height: 100))
                vista.backgroundColor = colorApp
                self.view.addSubview(vista)
                arregloVistas.append(vista)
            }
        }
        
        
    }
    
    func cancelar(sender:UIButton){
        print((sender.titleLabel?.text!)!)
        
        for vista in arregloVistas{
            vista.removeFromSuperview()
        }
        
        arregloVistas.removeAll()
    }
    
    //para actualizar todo cuando se rote la pantalla
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        vwCabecera.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 60)
        
        lbTitulo.frame = vwCabecera.frame
        
        segControler.frame = CGRect(x: margen, y: vwCabecera.frame.size.height + margen, width: self.view.frame.size.width - 20, height: 30)
        
        btnAceptar.frame = CGRect(x: margen, y: self.view.frame.size.height - 30 - margen, width: 120, height: 30)
        
        btnCancelar.frame = CGRect(x: self.view.frame.size.width - 120 - margen, y: btnAceptar.frame.origin.y , width: 120, height: 30)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
