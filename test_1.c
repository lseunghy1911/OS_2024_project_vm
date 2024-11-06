#include "types.h"
#include "stat.h"
#include "user.h"
#include "vm.h"

#define ELEMENTS (1 << 22)

int
main(int argc, char *argv[]) {
    struct mem_struct local_var = {0, 0, 0, 0, 0, 0, 0, 0};
    struct mem_struct heap_var = {0, 0, 0, 0, 0, 0, 0, 0};
    
    int a = 5;

    uint *b = malloc(ELEMENTS * sizeof(uint));
    for(int i = 0; i < ELEMENTS; i++) b[i] = 0;
    

    int status = walkpt(&local_var, (uint) &a);
    if(status != 0){
        printf(1, "systemcall error...\n");
    }
    printf(1, "Address translation parameters for local variable \"a\"\n");
    printf(1, "\tVirtual address: 0x%x\n", local_var.va);
    printf(1, "\tPage directory index: 0x%x, Page table index: 0x%x, Page offset: 0x%x\n", local_var.pd_index, local_var.pt_index, local_var.pg_offset);
    printf(1, "\tBase address of page directory: 0x%x\n", local_var.cr3);
    printf(1, "\tAddress of PDE: 0x%x\n", local_var.pde);
    printf(1, "\tPPN inside PDE: 0x%x\n", local_var.ppn_pde);
    printf(1, "\tBase address of page table (virtual): 0x%x\n", local_var.pgtab);
    printf(1, "\tAddress of PTE: 0x%x\n", local_var.pte);
    printf(1, "\tPPN inside PTE: 0x%x\n", local_var.ppn_pte);
    printf(1, "\tPhysical address: 0x%x\n", local_var.pa);

    status = walkpt(&heap_var, (uint) &b[ELEMENTS - 1]);
    if(status != 0){
        printf(1, "systemcall error...\n");
    }
    printf(1, "Address translation parameters for heap variable \"b[ELEMENTS-1]\" \n");
    printf(1, "\tVirtual address: 0x%x\n", heap_var.va);
    printf(1, "\tPage directory index: 0x%x, Page table index: 0x%x, Page offset: 0x%x\n", heap_var.pd_index, heap_var.pt_index, heap_var.pg_offset);
    printf(1, "\tBase address of page directory: 0x%x\n", heap_var.cr3);
    printf(1, "\tAddress of PDE: 0x%x\n", heap_var.pde);
    printf(1, "\tPPN inside PDE: 0x%x\n", heap_var.ppn_pde);
    printf(1, "\tBase address of page table (virtual): 0x%x\n", heap_var.pgtab);
    printf(1, "\tAddress of PTE: 0x%x\n", heap_var.pte);
    printf(1, "\tPPN inside PTE: 0x%x\n", heap_var.ppn_pte);
    printf(1, "\tPhysical address: 0x%x\n", heap_var.pa);

    free(b);
 
    exit();
}
