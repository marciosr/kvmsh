#!/bin/sh
sudo modprobe kvm-amd
#
#while true; do
MEM=$(zenity --scale --text "Escolha a quantidade de memória RAM para a máquina virtual (MB)" --min-value=100 --max-value=1024 --value=256 --step 2);
ARQ=$(zenity  --list  --text "Selecione a arquitetura do sistema operacional" --radiolist  --column "Seleção" --column "Arquitetura" TRUE qemu64 FALSE qemu32);
#
ISO_FILE=$(zenity --file-selection --file-filter=*.iso --title "Selecione uma imagem ISO");
#qemu-kvm -cdrom $ISO_FILE -m $MEM -boot d -cpu $ARQ -k pt-br -no-acpi;
case $?	in
	0) source `qemu-kvm -cdrom $ISO_FILE -m $MEM -boot c -cpu $ARQ -k pt-br -no-acpi -net nic,model=pcnet -net user -hda '/home/marcio/Diversos/Virtualização/Arch/arch.raw'`;;
	1) zenity --warning --text "Nenhuma imagem ISO selecionada";;
	-1) zenity --warning --text "Nenhuma imagem ISO selecionada";;
esac

