//
//  ContentView.swift
//  SpeedWallet4
//
//  Created by Group 9 on 2022/03/31.
//  Seiko Tan Shi Hui 0129141
//  Kelvin Khuan 0126272
//  Mohammad Fasihuddin 0131810

import SwiftUI

/*class refreshTotalBalance: ObservableObject //refresh (get-only property)
{
    @Published func priavate (_: set); var isPerforming = false
    
    func perform(_ refresh: RefreshAction) async
    {
        guard !isPerforming else {return}
        isPerforming = true
        await refresh()
        isPerforming =  false
    }
}*/ 


/*class updateBalance: ObservableObject //class that announces changes to its property
{
    var totalBalance: Double = 10.00
    {
        didSet
        {
            objectWillChange.send()
        }
    }
}*/


struct Money
{
    @State static var totalBalance = 10.00
    //var totalBalance: Double = 10.00
    //@StateObject var totalBal = updateBalance() //instance of the object
    /*var transBalance: Double //property wrapper???
    
    init(transBalance: Double)
    {
        self.transBalance = transBalance
        self._totalBal = StateObject(wrappedValue: updateBalance(transBalance: transBalance))
    }*/
    
    /*func trasnferTotalBalance(txtAmount: Double) -> Double
    {
    
        var tempTransBal: Double = 0.00
        
        tempTransBal = totalBalance - txtAmount
        
        return tempTransBal
    }
     */
    //let transBal = trasnferTotalBalance(5.5)
    //func Text(_: transBal)
    
    func cashOut(txtAmount: Double)
    {
        Money.totalBalance = Money.totalBalance - txtAmount
    }
    
    func cashIn(txtAmount: Double)
    {
        Money.totalBalance = Money.totalBalance + txtAmount
    }
    
    func printBalance() -> Double
    {
        return Money.totalBalance
    }
}

/*
struct userInput
{
    @State var phoneNumber: String = ""
    
    func printPhone()
    {
        print("Phone")
    }
    
    mutating func updatePhone(pNumber: String)
    {
        phoneNumber = pNumber
    }
}
 */



//DONE
struct ContentView: View //home
{
    var body : some View
    {
        Home()
    }
}


//DONE
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//DONE
struct Home : View //main page
{
    var body : some View
    {
        NavigationView
        {
            VStack
            {
                MainView(txt: "")
                    .navigationTitle("SpeedWallet")
                    
                
                Text("Balance")
                    .font(Font.custom("Avenir Next", size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)

                Text("\(String(format: "%.2f", Money.totalBalance))")//show balance
                    .font(Font.custom("Avenir Next", size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.yellow)
                
            
    
                NavigationLink(destination: Reload(), label:
                {
                    Text("Reload") //button that directs user to reload page
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 100)
                        .background(.purple)
                        .cornerRadius(20)
                })
                NavigationLink(destination: Scan(), label:
                {
                    Text("Scan") //button that directs user to scan page
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 100)
                        .background(.purple)
                        .cornerRadius(20)
                })
                NavigationLink(destination: Pay(), label:
                {
                    Text("Pay") //button that directs user to pay page
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 100)
                        .background(.purple)
                        .cornerRadius(20)
                })
                NavigationLink(destination: Transfer(), label:
                {
                    Text("Transfer") //button that directs user to transfer page
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(width: 200, height: 100)
                        .background(.purple)
                        .cornerRadius(20)
                })
                 
            }
        }
    }
}

struct Reload : View
{
    @State static var txtAmount = 10.00
    @State private var showSelection: Bool = false
    @State private var selectionResult: String = ""
    @State private var stringTxtAmount = String(Reload.txtAmount)
    let money2 = Money()
    
    var body : some View
    {
        VStack
        {
            var stringTxtAmount = String(Reload.txtAmount)
            //Text("Transfering to \(self.txtPNumber)")
            Text("Amount")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            TextField("Enter amount", text: $stringTxtAmount) //prompt user to enter amount to reload
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
            
            VStack //provide selections to user
            {
                Text("Reload")
                    .fontWeight(.bold)
                    .frame(width: 60, height: 40)
                    .foregroundColor(.yellow)
                
                NavigationLink(destination: cardReloadDetail(), label:
                {
                    Text("Card")
                        .fontWeight(.semibold)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.purple)
                        
                })
                NavigationLink(destination: bankReload(), label:
                {
                    Text("Bank")
                        .fontWeight(.semibold)
                        .frame(width: 50, height: 50)
                        .foregroundColor(.purple)
                })
                        
                
        MainView(txt: "")
            .navigationTitle("Reload")
            .foregroundColor(.purple)
    }
}
    }
}

func automaticReload()
{
    Money.totalBalance = Money.totalBalance + Reload.txtAmount
}

struct bankReload : View
{
    var body : some View
    {
        VStack
        {
            Text("Online Banking")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            Text("Select Bank")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
            
            List(bankL)
            {
                Text($0.bankName)
            }
        }
    }
}

struct BankList: Identifiable //display bank list in list view
{
    let id = UUID()
    let bankName: String
}

private var bankL = [
    BankList(bankName: "Public Bank"),
    BankList(bankName: "OCBC Bank"),
    BankList(bankName: "Maybank"),
    BankList(bankName: "RHB Bank"),
    BankList(bankName: "AmBank"),
    BankList(bankName: "Bank Islam"),
    BankList(bankName: "Hong Leong Bank"),
    BankList(bankName: "BSN")
]

struct cardReloadDetail : View //reload by card, enter card details
{
    @State var txtCardNumber: String = ""
    @State var txtCardYear: String = ""
    @State var txtCardCVV: String = ""
    @State var showMessage: Bool = false
    var body : some View
    {
        VStack
        {
            Text("Credit/ Debit Card")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            Text("Card Number")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
            
            TextField("Enter card number", text: $txtCardNumber)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
                
            Text("MM/YY")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
            
            TextField("Enter MM/YY", text: $txtCardYear)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
            
            Text("CVV")
                .font(.system(size: 20))
                .fontWeight(.semibold)
                .foregroundColor(.yellow)
            
            TextField("Enter CVV", text: $txtCardCVV)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
            
            Button("Complete Transaction")
            {
                showMessage.toggle()
            }
        }
    }
}


//DONE
struct Scan : View // scan page
{
    var body : some View
    {
        Text("Scan")
            .font(.system(size: 30))
            .fontWeight(.bold)
            .foregroundColor(.yellow)
        
        Image("scan camera 3")
        
        MainView(txt: "")
            .navigationTitle("Scan")
    }
}


//DONE
struct Pay : View // pay by barcode or qrcode
{
    var body : some View
    {
        Image("barcode 3")
            .resizable()
        
        Image("qrcode 3")
            .resizable()
        
        MainView(txt: "")
            .navigationTitle("Pay")
            .foregroundColor(.purple)
    }
}


//DONE
struct Transfer : View //transfer page, enter phone number,
{
    @State var txtPhoneNumber: String = ""
    @State var nxtTransfer: Bool = false
    var body : some View
    {
        VStack
        {
            MainView(txt: "")
                .navigationTitle("Transfer")
                
            Text("Phone Number")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            TextField("Enter a phone number", text: $txtPhoneNumber, onCommit:{
                self.nxtTransfer = true
            }).textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.webSearch)
          
            
            NavigationLink(destination: TransferMoney(), label:
            {
                Text("Transfer Money")
                    .font(.system(size: 19))
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 100)
            })
        }
    }
}

struct TransferMoney : View // transfer- enter amount and details then reload
{
    @State var txtAmount: String = ""
    @State var txtDetails: String = ""
    @State var showAlert: Bool = false
    @State private var value = 0
    
    
    /*var txtAmountD: Binding<String>
    {
        Binding<String>(
            get:
                {
                String(format: "%.2f", Double(txtAmount))
                },
            
            set:
                {
                    if let value = NumberFormatter().number(from: $0)
                    {
                        txtAmount = value.doubleValue
                    }
                }
        )
    }*/
    
    var body: some View
    {
        VStack
        {
            //Text("Transfering to \(self.txtPNumber)")
            Text("Amount")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            TextField("Enter amount", text: $txtAmount)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
        VStack
        {
            Text("You can only transfer total amount of \(String(format: "%.2f", Money.totalBalance))")
                .font(.system(size: 15))
                .fontWeight(.light)
                .foregroundColor(.gray)
            
            Text("")
            Text("Details")
                .font(.system(size: 30))
                .fontWeight(.bold)
                .foregroundColor(.yellow)
            
            TextField("Enter details", text: $txtDetails)
                .textFieldStyle(.roundedBorder)
                .font(.callout)
                .padding()
                .background(Color.purple.opacity(0.2).cornerRadius(40))
                .frame(maxWidth: 600)
                .keyboardType(.numberPad)
            
            Button("Confirm Transfer")
            {
                showAlert = true
            }.alert("Money Transfered!", isPresented: $showAlert)
            {
                Button("Done", role: .cancel){}
            }
        }
        }
    }
}
        

struct MainView : View //redirect user back to the main page
{
    var txt: String = ""
    
    var body : some View
    {
        Text("\(txt)")
    }
}
