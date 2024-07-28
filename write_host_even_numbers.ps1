$numbertotal = 10000

Measure-Command -Expression {
    for($i=0; ($i -le $numbertotal );$i++){
        if($i % 2 -eq 0)
            { Write-Host "Number $i is a even number less than or equal to $numbertotal"
            }
        #else{continue}
    }
}


Measure-Command -Expression {
        $mylist = New-Object -TypeName System.Collections.ArrayList

        $mylist.AddRange(0..$numbertotal)

        $mylist.ForEach(
            {
                if($_ -le $numbertotal)
                    { Write-Host "Number $_ is a even number less than or equal to $numbertotal"
                    }
                #else{continue}
            }
        )

}
            