public class DiscountService {
public static Decimal calcDiscount(Decimal annualRevenue,string industry)
{
    if(annualRevenue == null) annualRevenue =0;
    if(string.isBlank(industry))industry='other';
    Decimal base=0;
    if(annualRevenue>=10000000){
        base=0.15;
    }else if(annualRevenue>=1000000){
        base=0.10;
    }else{
        base=0.05;
    }
    base+=(industry=='Technology')? 0.02:0.00;
    return base.setScale(2);
}
}