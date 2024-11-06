#ifndef VM_H
#define VM_H

// custom data struct for EEE3535: Operating Systems
struct mem_struct{
    uint va;        // virtual address
    uint pd_index;  // page directory index
    uint pt_index;  // page table index
    uint pg_offset; // page offset
    uint cr3;       // base address of page directory
    uint pde;       // address of PDE
    uint ppn_pde;   // PPN inside PDE
    uint pgtab;     // base address of page table
    uint pte;       // address of PTE
    uint ppn_pte;   // PPN inside PTE
    uint pa;        // physical address
};

int walkpt(struct mem_struct *my_struct, uint va);

#endif
