// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;

contract Loteria {

    uint256 constant NUMEROS_POR_CARTON = 2;

    struct Participante {
        string nombre;
        uint256[NUMEROS_POR_CARTON] carton;
        uint256[NUMEROS_POR_CARTON] aciertos;
        uint256 cantidadAciertos;
    }
    Participante[] private participantes;

    address private owner;
    address private ganador;
    uint256 private numeroRonda;
    int private ultimoNumero;
    
    bool private juegoActivo;

    //uint256 private premio;
    

    //payable
    //constructor(uint256 _numeroGanador, uint256 _premio) payable {
    constructor() payable{
        owner = msg.sender;
        numeroRonda = 0;
        ultimoNumero = -1;
        juegoActivo = true; //para activar o desactivar el juego
    }

  
    function comprobarAcierto(uint256 _num) public view returns(bool) {
        return ultimoNumero == int(_num);
    }

    //"Random function" realmente es seudorandom(?)
    //private porque es una funcion que solo puede ser accedida dentro del contrato
    function rand(uint256 n) private view returns(uint256) {
        //primero se castea a uint256
        //keccak256 es un algoritmo de hash (criptografia unidireccional)
        //now es el tiempo de minado, msg sender es la direccion de la persona que lo ejecuta
        // los algoritmos de hash siempre son diferentes por eso se genera un numero pseudo aleatorio. 
        // esto genera un valor entero y luego lo castea a uint256
        return uint256( keccak256( abi.encode(block.timestamp + n, msg.sender, ultimoNumero ) ) ) % 10;
    }

    function ultimoNum() public view returns(int){
        return ultimoNumero;
    }

    function verificarGanador() private view returns(bool) {
        for(uint i;i<participantes.length;i++){
            if(participantes[i].cantidadAciertos == NUMEROS_POR_CARTON){
                return true;
            }
        }
        return false;
    }

    function agregarAcierto(int _numSalio) private {
        for(uint256 i = 0; i< participantes.length; i++){
            Participante memory part = participantes[i];
            for(uint j=0; j<part.carton.length; j++){
                if( part.carton[j] == uint256(_numSalio) ){
                    participantes[i].cantidadAciertos++;
                    break;
                }
            }
        }
    }

    function aumentarRonda() public {
        numeroRonda++;
    }

    function participar(string memory _nombre) public {
        uint256[NUMEROS_POR_CARTON] memory rands;
        uint256[NUMEROS_POR_CARTON] memory acs;
        for(uint256 i=0; i<NUMEROS_POR_CARTON;i++){
            rands[i] = rand(bytes(_nombre).length + i);
            acs[i] = 0;
        }

        Participante memory part = Participante(_nombre, rands, acs, 0);
        participantes.push(part);
    }

    function verCarton(uint256 _id) public view returns(Participante memory) {
        return participantes[_id];
    }

    function realizarJugada() public returns(bool) {
        ultimoNumero = int(rand(1));

        aumentarRonda();

        agregarAcierto(ultimoNumero);

        return verificarGanador();
    }
}
