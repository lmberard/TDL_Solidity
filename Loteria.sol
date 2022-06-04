// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Loteria {

    address private owner;
    address private ganador;
    uint256 private numeroRonda;
    uint256 private numeroGanador;
    int private ultimoNumero;

    uint256 private premio;
    bool private juegoActivo;
    
    //payable
    constructor(uint256 _numeroGanador, uint256 _premio) payable {
        owner = msg.sender;
        numeroRonda = 0;
        ultimoNumero = -1;
        numeroGanador = _numeroGanador;
        premio = _premio; //(?)
        juegoActivo = true; //para activar o desactivar el juego
    }

  
    function comprobarAcierto(uint256 _num) public view returns(bool) {
        return ultimoNumero == int(_num);
    }

    //"Random function" realmente es seudorandom(?)
    function numeroRandom() private view returns(uint256) {
        //primero se castea a uint256
        //keccak256 es un algoritmo de hash (criptografia unidireccional)
        //now es el tiempo de minado, msg sender es la direccion de la persona que lo ejecuta
        // los algoritmos de hash siempre son diferentes por eso se genera un numero pseudo aleatorio. 
        // esto genera un valor entero y luego lo castea a uint256
        return uint256( keccak256( abi.encode(block.timestamp, msg.sender, ultimoNumero ) ) ) % 10;
    }

    function ultimoNum() public view returns(int){
        return ultimoNumero;
    }

    function realizarJugada() public {
        ultimoNumero = int(numeroRandom());
    }
    
}
