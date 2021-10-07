export class Pembelian{
    id? : Number;
    mid : String = "";
    mnama : String = "";
    tid : String = "";
    tnama : String = "";
    tanggal : Date = new Date();
    persatuan : number = 0;
    jumlah : number = 0;
    total : number = 0;
    ket : String = "";
    isSuccess? : Number;
    notes? : String;
    ip? : any;
    token? : any;
}