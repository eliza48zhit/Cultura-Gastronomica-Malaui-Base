// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title CulturaMalaui
 * @dev Registro de resistencia mecanica de almidones y proteinas lacustres.
 * Serie: Sabores de Africa (34/54)
 */
contract CulturaMalaui {

    struct Plato {
        string nombre;
        string ingredientes;
        string preparacion;
        uint256 resistenciaNsima;   // Firmeza estructural de la masa (1-10)
        uint256 integridadProteina; // Calidad del filete post-coccion (1-100)
        bool esDelLagoMalaui;       // Certificacion de origen lacustre
        uint256 likes;
        uint256 dislikes;
    }

    mapping(uint256 => Plato) public registroCulinario;
    uint256 public totalRegistros;
    address public owner;

    constructor() {
        owner = msg.sender;
        // Inauguramos con el Chambo con Nsima (Ingenieria de la Masa)
        registrarPlato(
            "Chambo con Nsima", 
            "Pescado Chambo, harina de maiz blanco, tomates, cebollas.",
            "Batido vigoroso de la harina en agua hirviendo hasta lograr una masa solida; pescado frito o asado con salsa de tomate.",
            10, 
            92, 
            true
        );
    }

    function registrarPlato(
        string memory _nombre, 
        string memory _ingredientes,
        string memory _preparacion,
        uint256 _resistencia, 
        uint256 _integridad,
        bool _lago
    ) public {
        require(bytes(_nombre).length > 0, "Nombre requerido");
        require(_resistencia <= 10, "Resistencia fuera de rango");

        totalRegistros++;
        registroCulinario[totalRegistros] = Plato({
            nombre: _nombre,
            ingredientes: _ingredientes,
            preparacion: _preparacion,
            resistenciaNsima: _resistencia,
            integridadProteina: _integridad,
            esDelLagoMalaui: _lago,
            likes: 0,
            dislikes: 0
        });
    }

    function darLike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].likes++;
    }

    function darDislike(uint256 _id) public {
        require(_id > 0 && _id <= totalRegistros, "ID invalido");
        registroCulinario[_id].dislikes++;
    }
}
