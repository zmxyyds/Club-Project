using Godot;
using System;
using System.ComponentModel.DataAnnotations;

public partial class Health : Node
{
	[ExportGroup("生命值")]
	/// <summary>
	/// 最大的生命值	
	/// </summary>
	[Export] private float maxHealth = 100;
	/// <summary>
	/// 最大的生命值
	/// </summary>
	/// <remarks>
	/// 在这里set maxHealth很不安全<para/>
	/// 你可以通过<see cref="SetMaxHealth(float, bool)"/>方法来修改maxHealth,
	/// 并选择是否要按照比例来修改currentHealth
	/// </remarks>
	/// <value><see cref="maxHealth"/></value>
	public float MaxHealth { get { return maxHealth; } set { maxHealth = value; } }
	
	public void SetMaxHealth(float value, AllEnum.SetMaxHealthMode mode = AllEnum.SetMaxHealthMode.Set, AllEnum.SetCurrentHealthMode currentHealthMode = AllEnum.SetCurrentHealthMode.Proportion)
	{
		float temp = maxHealth;
		switch (mode)
		{
			case AllEnum.SetMaxHealthMode.Set:
				maxHealth = value;
				break;
			case AllEnum.SetMaxHealthMode.Add:
				maxHealth += value;
				break;
			case AllEnum.SetMaxHealthMode.Proportion:
				maxHealth *= value;
				break;
		}


		switch (currentHealthMode)
		{
			case AllEnum.SetCurrentHealthMode.Proportion:
				currentHealth = currentHealth / temp * maxHealth;
				break;

			case AllEnum.SetCurrentHealthMode.Sync:
				currentHealth += maxHealth - temp;
				break;
			case AllEnum.SetCurrentHealthMode.NoAction:
				currentHealth = Math.Min(currentHealth, maxHealth);
				break;
		}
		GD.Print($"最大生命值被设置，MaxHealth: {maxHealth}, currentHealth: {currentHealth}");
	}
	
	//Thisssssssssssssssssss这里要改，这个SetMaxHealth是测试用的
	/*
	public void SetMaxHealth(float value){
		GD.Print($"SetMaxHealth: {value}");
	}
	*/
	[Export] private float currentHealth;
	/// <summary>
	/// 当前的生命值
	/// </summary>
	/// <value><see cref="currentHealth"/></value>
	public float CurrentHealth { get { return currentHealth; } set { currentHealth = value; } }

	public override void _Ready()
	{
		currentHealth = maxHealth;
		GD.Print($"新的Health组件被创建，MaxHealth: {maxHealth}, currentHealth: {currentHealth}");
	}
}
