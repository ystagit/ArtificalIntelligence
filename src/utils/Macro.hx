package utils;

import haxe.ds.Vector;
import haxe.macro.Expr;

class Macro {

    public static macro function createIntVector(size:Expr) {
        return macro {
            final vec = new Vector<Int>(size);
            for (i in 0...size) vec.set(i, 0);
            vec;
        }
    }

}