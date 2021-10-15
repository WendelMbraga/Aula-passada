import React, { useState, useEffect } from 'react';
import "tailwindcss/tailwind.css"


function Welcome(props){
    const [contador, setContador] = useState(0);

    const {name} = props;
    
    function incrementar(){
        setContador(contador+1);
    }

    useEffect( ()=> {
        console.log("Contador mudou", contador);
    }, [contador]);

    return(
        <>
            <h1 className="flex">{name}: {contador}</h1>
            <button onClick={incrementar}>Incrementar</button>
        </>
    );
}

export default Welcome;