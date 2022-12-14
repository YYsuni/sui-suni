module suni::module_01 {
  use sui::object::{Self, UID};
  use sui::tranfer;
  use sui::tx_context::{Self, TxContext};


  struct Sword has key, store {
    id: UID,
    magic: u64,
    strength: u64
  }

  struct Forge has key, store {
    id: UID,
    swords_created: u64
  }

  fun init(ctx: &mut TxContext) {
    let admin = Forge {
      id: object::new(ctx),
      swords_created: 0
    };

    transfer::transfer(admin, tx_context::sender(ctx));
  }

  public fun magic(self: &Sword): u64 {
    self.magic
  }

  public fun strength(self: &Sword): u64{
    self.strength
  }

  public fun swords_created(self: &Forge): u64 {
    self.swords_created
  }

}