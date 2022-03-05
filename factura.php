<?php

require('fpdf183/fpdf.php');
require ('modelo/BD.php');
require ('modelo/Empleado.php');
require('modelo/Factura.php');
require('modelo/LineaFactura.php');
require ('modelo/ListaLineasFactura.php');
require ('modelo/ListaLineasPedidos.php');

// DECLARACIÓN DE LAS VARIABLES

/*
LO SIGUIENTE HAY QUE QUITARLO YA QUE LA FACTURA YA SE HABRA GENERADO ANTES DE ENTRAR AQUI
$listaLineasPedidos = new ListaLineasPedidos();
$listaLineasPedidos->getListaPedidosMesa(2);

$factura = $listaLineasPedidos->crearFactura(2, $empleado->getNombre(), 2);
*/
/* Esto es lo que habría que hacer con una id que llegara con post*/
// Creo la factura y la obtengo de la bd
$factura = new Factura();
$factura->obtenerPorIdFactura(2);

/* Obtenermos la fecha y hora */
$fecha = substr($factura->getFecha(), 0, 10);
$hora = substr($factura->getFecha(), 10);

// Obtengo las lineas de la factura mediante una clase que contiene un array
$listaLineasFactura = new ListaLineasFactura();
$listaLineasFactura->obtenerListaLineasFacturas($factura->getNumeroFactura());

// Creo el objeto pdf que me servira para generar la factura
$pdf = new FPDF();
$pdf->SetTitle("FACTURA", true);
$pdf->AddPage();
$pdf->SetAutoPageBreak(true, 1);
$pdf->Image('./Pag/Testo-HTML/HTML/images/logo-01.png',10,10,90);

// ME QUEDA OBTENER LA HOJA Y EL ALBARAN, Y CREAR EL FORMULARIO

// TITULO
$pdf->SetFont('Arial', 'B', 15);
$pdf->Ln(10);

// DATOS DE LA EMPRESA Y EL CLIENTE

$margenLeft = 125;

$pdf->Cell($margenLeft);
$pdf->Cell(50, 10, utf8_decode("Madrid, Sol, CP 90036"), 0, 1, 'L', 0);
$pdf->Cell($margenLeft);
$pdf->Cell(50, 10, utf8_decode("Llámanos: 789-654-3210"), 0, 1, 'L', 0);
$pdf->Cell($margenLeft);
$pdf->Cell(50, 10, utf8_decode("Email: testo@email.com"), 0, 1, 'L', 0);

$pdf->Ln(20);

$pdf->SetFont('Arial', 'B', 15);

// DATOS DE LA FACTURA
$pdf->Cell(5);
$pdf->Cell(134, 10, utf8_decode("TIQUET  T00" . $factura->getNumeroFactura()), 0, 0, 'L', 0);
$pdf->Cell(50, 10, utf8_decode("Fecha:  " . $fecha), 0, 1, 'L', 0);

$pdf->Ln(2);

$pdf->SetFont('Arial', 'B', 24);
$pdf->Cell(5);
$pdf->Cell(142, 10, utf8_decode("MESA 1"), 0, 0, 'L', 0);

$pdf->SetFont('Arial', 'B', 15);
$pdf->Cell(20, 10, utf8_decode("Hora:  " . $hora), 0, 1, 'L', 0);

$pdf->Ln(2);

// EMPLEADO

$pdf->Cell(5);
$pdf->Cell(50, 10, utf8_decode("Empleado: " . $factura->getEmpleado()), 0, 1, 'L', 0);
$pdf->Ln(5);


// LISTA DE PEDIDOS DE LA FACTURA

// lengths de los 4 campos
$lgthUnidades = 40;
$lgthDescripcion = 92;
$lgthPVP = 30;
$lgthImporte = 25;

// titulos
$pdf->Cell(5);
$pdf->Cell($lgthUnidades, 10, utf8_decode("Unidades"), 0, 0, 'L', 0);
$pdf->Cell($lgthDescripcion, 10, utf8_decode("Descripción"), 0, 0, 'L', 0);
$pdf->Cell($lgthPVP, 10, utf8_decode("PVP"), 0, 0, 'L', 0);
$pdf->Cell($lgthImporte, 10, utf8_decode("Importe"), 0, 1, 'L', 0);
$pdf->Cell(5);
$pdf->Cell(120, 10, "-------------------------------------------------------------------------------------------------------", 0, 1, 'L', 0);

// Vatiables para los calculos
$importeProducto = 0;
$importeTotal = 0;
$importeIva4 = 0;
$importeIva10 = 0;
$importeIva21 = 0;
$importeIvaTotal = 0;

for ($i = 0; $i < count($listaLineasFactura->getLista()); $i++) {

    $importeProducto = round($listaLineasFactura->getLista()[$i]->getCantidadProducto() * $listaLineasFactura->getLista()[$i]->getPrecioProducto(), 2);
    $pdf->Cell($lgthUnidades, 10, utf8_decode($listaLineasFactura->getLista()[$i]->getCantidadProducto()), 0, 0, 'C', 0);
    $pdf->Cell($lgthDescripcion, 10, utf8_decode($listaLineasFactura->getLista()[$i]->getNombreProducto()), 0, 0, 'L', 0);
    $pdf->Cell($lgthPVP, 10, utf8_decode($listaLineasFactura->getLista()[$i]->getPrecioProducto()), 0, 0, 'C', 0);
    $pdf->Cell($lgthImporte, 10, utf8_decode($importeProducto), 0, 1, 'C', 0);

    // Calculos para la base imponible e ivas
    $importeTotal += $importeProducto;

    if ($listaLineasFactura->getLista()[$i]->getIvaProducto()==4) {

        $importeIva4 += round($importeProducto * 0.04, 2);

    }else if ($listaLineasFactura->getLista()[$i]->getIvaProducto()==10) {

        $importeIva10 += round($importeProducto * 0.10, 2);

    }else {

        $importeIva21 += round($importeProducto * 0.21, 2);

    }

}

$importeIvaTotal = $importeIva4 + $importeIva10 + $importeIva21;

$pdf->Cell(5);
$pdf->Cell(120, 10, "===========================================================", 0, 1, 'L', 0);

// BASE IMPONIBLE E IVASs

$pdf->Cell(105);
$pdf->Cell(64, 10, utf8_decode("BASE IMPONIBLE"), 0, 0, 'L', 0);
$pdf->Cell(20, 10, utf8_decode($importeTotal), 0, 1, 'L', 0);

if ($importeIva4>0) {

    $pdf->Cell(105);
    $pdf->Cell(64, 10, utf8_decode("TAX/IVA    4%"), 0, 0, 'L', 0);
    $pdf->Cell(20, 10, utf8_decode($importeIva4), 0, 1, 'L', 0);

}

if ($importeIva10>0) {

    $pdf->Cell(105);
    $pdf->Cell(64, 10, utf8_decode("TAX/IVA    10%"), 0, 0, 'L', 0);
    $pdf->Cell(20, 10, utf8_decode($importeIva10), 0, 1, 'L', 0);

}

if ($importeIva21>0){

    $pdf->Cell(105);
    $pdf->Cell(64, 10, utf8_decode("TAX/IVA    21%"), 0, 0, 'L', 0);
    $pdf->Cell(20, 10, utf8_decode($importeIva21), 0, 1, 'L', 0);

}

$pdf->ln(10);

// TOTAL

$pdf->SetFont('Arial', 'B', 24);
$pdf->Cell(110);
$pdf->Cell(50, 10, utf8_decode("TOTAL         " . ($importeTotal + $importeIvaTotal)), 0, 1, 'L', 0);

// FINAL

$pdf->ln(15);
$pdf->SetFont('Arial', 'B', 14);
$pdf->Cell(58);
$pdf->Cell(50, 10, utf8_decode("IVA INCLUIDO / TAV INCLUDED"), 0, 1, 'L', 0);

$pdf->Output();
